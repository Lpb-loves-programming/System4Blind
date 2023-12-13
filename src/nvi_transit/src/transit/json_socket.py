
import socket
import json
import signal
import threading
import os

_HEADER_LENGTH = 32
_HEADER_NUMBER_LENGTH = _HEADER_LENGTH - 22 # {'content-length':'0000000000'}


# _EXIT_HEADER_BYTES = json.dumps({'content-length':(_HEADER_NUMBER_LENGTH-2)*'0'+'28'}).encode('utf-8')
# _EXIT_JSON = {'type':'Exit','data':''} # length 28
# _EXIT_BYTES = json.dumps(_EXIT_JSON).encode('utf-8')

def create_handler(obj):
    def _handler(signum, frame):
        # obj.sendall(_EXIT_HEADER_BYTES)
        # obj.sendall(_EXIT_BYTES)
        obj.close()
        signal.signal(signum, signal.SIG_DFL)
        os.kill(os.getpid(), signum) 
    return _handler


class JsonSocket():
    '''
    TCP Connection socket.AF_INET, socket.SOCK_STREAM
    '''
    def __init__(self,_socket=None) -> None:
        self._socket = _socket
        if self._socket is None:
            self._socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        signal.signal(signal.SIGINT, create_handler(self._socket))
        self._socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.is_sending = threading.Semaphore(1)
            
    def recv_json(self):
        data = self._socket.recv(_HEADER_LENGTH) # 32 header length
        if data == b'':
            return {}
        lost_content_length = _HEADER_LENGTH - len(data)
        while lost_content_length > 0:
            data += self._socket.recv(lost_content_length)
            lost_content_length = _HEADER_LENGTH - len(data)
        data_json = json.loads(data)
        content_length = int(data_json['content-length'])
        lost_content_length = content_length
        data = b''
        while lost_content_length>0:
            data += self._socket.recv(lost_content_length)
            lost_content_length = content_length-len(data)
        # data_json = json.loads(data)
        # if data_json['type'] == _EXIT_JSON['type']:
        #     return {}
        # try:
        # return data_json
        return json.loads(data)
        # except:
        #     print(content_length,data)
    
    def send_json(self,data_json):
        data = json.dumps(data_json).encode('utf-8')
        data_length_str = str(len(data))
        # 32 header length
        if len(data_length_str) > _HEADER_NUMBER_LENGTH:
            raise ValueError('Transited data exceed the maximum bytes limitation.')
        network_header_json = {'content-length':(_HEADER_NUMBER_LENGTH-len(data_length_str))*'0'+data_length_str}
        network_header = json.dumps(network_header_json).encode('utf-8')
        self.is_sending.acquire()
        try:
            self._socket.sendall(network_header,socket.MSG_NOSIGNAL)
            self._socket.sendall(data,socket.MSG_NOSIGNAL)
        except:
            pass
        self.is_sending.release()
    
    def accept(self):
        '''
        Override of socket.accept()
        return the connetion in JsonSocket class
        '''
        conn, client_addr = self._socket.accept()
        return JsonSocket(conn), client_addr

    def __getattr__(self, __name: str):
        """Serve same API as socket.socket"""
        return self._socket.__getattribute__(__name)