# coding:utf8
import Queue


class Player():
    def __init__(self):
        self.msg_q = Queue.Queue()

    # 获取用户队列里的所有消息
    def gettMsg(self):
        msgs = []  # 获取这个对象的所有消息并添加到列表中
        if self.msg_q.qsize() > 0:
            for msg in range(self.msg_q.qsize()):  # 循环消息列表
                msg = self.msg_q.get()  # 获取消息
                msgs.append(msg)  # 加到列表中
        else:  # 队列当中没有消息
            try:
                msgs.append(self.msg_q.get(timeout=60))
            except Exception, e:
                return msgs

        return msgs  # 返回消息列表
