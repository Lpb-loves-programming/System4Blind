import openai
import rospy
from std_msgs.msg import String


openai.api_base = 'http://api.visfmod.com/v1'
openai.api_key = 'fk-juhaokun/BbK7dvZ4niH8FSCi'
def chat(msg):
    response = openai.Completion.create(
        model = 'text-davinci-003',
        prompt = f'Human:{msg.data}\nAI:',
        tempreture=0.7,
        max_tokens=256,
        top_p=1,
        frequency_penalty=0,
        presence_penalty=0,
        stop=['Human: ', 'AI: ']
    )
    r = response['choices'][0]['text']
    rospy.logwarn(r)
    


if __name__ == "__main__":
    rospy.init_node('gpt_node')
    question = rospy.Subscriber('chat', String,chat)
    response = rospy.Publisher('answer', String)
    rospy.spin()