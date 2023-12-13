import json
_MESSAGE_ID_MARK = '# MESSAGE ID'
_MESSAGE_MARK = '# ROS MESSAGE'
_PUBLISHER_MARK = '# PUBLISHER HANDLE'
_SUBSCRIBER_MAKR = '# SUBSCRIBER HANDLE'
_SUBSCRIBER_CANCELLATION_MARK = '# SUBSCRIBER CANCELLATION HANDLE'
_MARK_LIST = [_MESSAGE_MARK,_PUBLISHER_MARK,_SUBSCRIBER_MAKR,_SUBSCRIBER_CANCELLATION_MARK]

class TransitMsgConfig:
    def __init__(self) -> None:
        self.msgs = {}
        self.MSG_SRC = ['edge','server']
        for src in self.MSG_SRC:
            self.msgs[src] = []
            
    def parse_json(self,filepath):
        with open(filepath, encoding='utf-8') as file:
            json_file = json.load(file)
            for msgs in json_file.values():
                for msg in msgs:
                    if msg['src'] not in self.MSG_SRC:
                        print('Invalid msg source '+msg['src']+'.')
                    else:
                        self.msgs[msg['src']].append(msg)

class NVITransitCodeGenerator:
    def __init__(self,edge_file_path,server_file_path,transit_msgs_file_path='',transit_msg_config_path=''):
        self.file_path = {'edge':edge_file_path, 'server':server_file_path}
        self.transit_msg_config = TransitMsgConfig()
        self.transit_msg_config.parse_json(transit_msg_config_path)
        self.transit_msgs_file_path = transit_msgs_file_path
    
    @staticmethod
    def search_idx(array:list, pattern:str):
        pattern_begin, pattern_end = pattern+' BEGIN', pattern+' END'
        begin_idx, end_idx = -1, -1
        for idx, line in enumerate(array):
            if pattern not in line:
                continue
            if pattern_begin in line:
                begin_idx = idx
            if pattern_end in line:
                end_idx = idx
            if begin_idx !=-1 and end_idx!=-1:
                break
        if begin_idx == -1:
            raise ValueError('Not found pattern '+pattern_begin+'.')
        if end_idx == -1:
            raise ValueError('Not found pattern '+pattern_end+'.')
        return begin_idx, end_idx

    def generta_msg_id_code(self,indentation=''):
        msgs = []
        for value in self.transit_msg_config.msgs.values():
            msgs += value
        code = []
        ids = indentation + '_ROS_MESSAGE_IDS_GENERATED = {'
        for msg in msgs:
            ids +=  "'{}':{}, ".format(msg['id'],msg['type'])
        ids = ids[:-2] + '}\n'
        code.append(ids)
        return code

    def generta_msg_code(self,indentation=''):
        msgs = []
        for value in self.transit_msg_config.msgs.values():
            msgs += value
        pkgs = {}
        code = []
        MSG_TEMPLATE = indentation+'from {} import {}\n'
        for msg in msgs:
            if msg['pkg'] not in pkgs:
                pkgs[msg['pkg']] = set()
            pkgs[msg['pkg']].add(msg['type'])
        for key in pkgs:
            value = list(pkgs[key])
            value.sort()
            types = value[0]
            for i in range(1, len(value)):
                types += ', '+value[i]
            code.append(MSG_TEMPLATE.format(key,types))
        return code
    
    def generate_publisher_code(self,src,indentation=''):
        msgs = self.transit_msg_config.msgs[src]
        code = []
        ids = indentation + 'self._PUBLISH_IDS_GENERATED = {'
        PUBLISHER_TEMPLATE = indentation + "self.{}_pub = rospy.Publisher('{}', {}, queue_size={})\n"
        for msg in msgs:
            code.append(PUBLISHER_TEMPLATE.format(msg['id'],msg['topic'],msg['type'],msg['queue_size']))
            ids +=  "'{}':self.{}_pub, ".format(msg['id'],msg['id'])
        ids = ids[:-2] + '}\n'
        code.append(ids)
        return code
    
    def generate_subscriber_code(self,src,indentation=''):
        msgs = self.transit_msg_config.msgs[src]
        code = []
        SUBSCRIBER_TEMPLATE = indentation + "self.{}_sub = rospy.Subscriber('{}', {}, self.any_callback('{}'), queue_size={})\n"
        for msg in msgs:
            code.append(SUBSCRIBER_TEMPLATE.format(msg['id'], msg['topic'], msg['type'], msg['id'], msg['queue_size']))
        return code
    
    def generate_subscriber_cancellation_code(self,src,indentation=''):
        msgs = self.transit_msg_config.msgs[src]
        code = []
        _SUBSCRIBER_CANCELLATION_TEMPLATE = indentation + "self.{}_sub.unregister()\n"
        for msg in msgs:
            code.append(_SUBSCRIBER_CANCELLATION_TEMPLATE.format(msg['id']))
        return code
    
    def generate_transit_code(self):
        file_path = self.transit_msgs_file_path
        pycodes = []
        with open(file_path,'r') as pyfile:
            pycodes  = pyfile.readlines()
            start_idx, end_idx = self.search_idx(pycodes,_MESSAGE_MARK)
            indentation = ' '*pycodes[start_idx].index('#')
            # pycodes += input_pycodes[:start_idx[0]]
            pycodes[start_idx+1:end_idx] = self.generta_msg_code(indentation)
            start_idx, end_idx = self.search_idx(pycodes,_MESSAGE_ID_MARK)
            indentation = ' '*pycodes[start_idx].index('#')
            pycodes[start_idx+1:end_idx] = self.generta_msg_id_code(indentation)
        with open(file_path,'w') as pyfile:
            pyfile.writelines(pycodes)
        print('Generate '+file_path+' successfully.')

    def generate_node_code(self,src):
        if src not in self.file_path:
            raise ValueError('Invalid msg source '+src+'.')
        file_path = self.file_path[src]
        if src is 'edge':
            publisher_src = 'server'
        elif src is 'server':
            publisher_src = 'edge'
        with open(file_path,'r') as pyfile:
            pycodes  = pyfile.readlines()
            # message, publisher, suscriber, suscriber cancellation
            start_idx = [0,0,0,0]
            end_idx = [0,0,0,0]
            indentation = ['','','','']
            for i, mark in enumerate(_MARK_LIST):
                start_idx, end_idx = self.search_idx(pycodes,mark)
                indentation = ' '*pycodes[start_idx].index('#')
                if i == 0:
                    pycodes[start_idx+1:end_idx] = self.generta_msg_code(indentation)
                elif i == 1:
                    pycodes[start_idx+1:end_idx] = self.generate_publisher_code(publisher_src, indentation)
                elif i == 2:
                    pycodes[start_idx+1:end_idx] = self.generate_subscriber_code(src, indentation)
                elif i == 3:
                    pycodes[start_idx+1:end_idx] = self.generate_subscriber_cancellation_code(src, indentation)
                else:
                    raise ValueError('Invalid item index '+i+'.')
        with open(file_path,'w') as pyfile:
            pyfile.writelines(pycodes)
        print('Generate '+file_path+' successfully.')
    
    def generate(self):
        self.generate_node_code('edge')
        self.generate_node_code('server')
        self.generate_transit_code()


if __name__ == '__main__':
    import os
    CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))

    edge_file_path = CURRENT_DIR + '/scripts/nvi_transit_edge_node.py'
    server_file_path = CURRENT_DIR + '/scripts/nvi_transit_server_node.py'
    transit_msgs_file_path = CURRENT_DIR + '/src/transit/ros_msgs_transit.py'
    transit_msg_config_path = CURRENT_DIR +'/config/transit_msg.json'
    code_generator = NVITransitCodeGenerator(edge_file_path,server_file_path,transit_msgs_file_path,transit_msg_config_path)
    code_generator.generate()
    # edge_file_path = './scripts/nvi_transit_edge_node.py'
    # server_file_path = './scripts/nvi_transit_server_node.py'
    # transit_msgs_file_path = 'ros_msgs_transit.py'
    # transit_msg_config_path = 'transit_msg.json'
    # code_generator = NVITransitCodeGenerator(edge_file_path,server_file_path,transit_msgs_file_path,transit_msg_config_path)
    # code_generator.generate()
