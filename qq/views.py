# coding:utf8
from django.shortcuts import render, HttpResponseRedirect, HttpResponse
from django.contrib import auth
import json
import datetime
from common import Player

# Create your views here.

user_dict = {}  # 全局用户字典


def index(request):
    return render(request, 'qq.html', {'name': 'xiaomei', 'age': 'age', })


def login(request):
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        if username and password:
            user = auth.authenticate(username=username, password=password)  # 如果验证成功返回用户对象，如果失败返回None
            if user is not None:
                if user.is_active:
                    # 做登陆操作
                    auth.login(request, user)
                    return HttpResponseRedirect('/')
                else:
                    return render(request, 'login.html', {'error': '账号已冻结'})
            else:
                return render(request, 'login.html', {'error': '用户名或密码错误'})
    else:
        return render(request, 'login.html')


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/login/')


def sendMsg(reuqest):
    data = reuqest.POST.get('data', None)  # 接受前端传过来的json
    data = json.loads(data)  # 把json转成python字典
    now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')  # 获取服务器时间
    data['time'] = now
    to_id = int(data['to_id'])  # 获取朋友的id
    if to_id not in user_dict:  # 如果用户不在全局用户字典中则加入
        user_dict[to_id] = Player()
    try:
        user_dict[to_id].msg_q.put(data)  # 向用户字典中的对象的队列里加入一条消息
    except Exception, e:
        print e
    return HttpResponse('ok')


# 获取消息
def getMsg(request):
    uid = request.GET.get('uid', None)  # 获取请求消息用户ID
    if uid is not None:
        uid = int(uid)
        if uid not in user_dict:  # 如果用户首次请求则建立用户实例
            user_dict[uid] = Player()
        try:
            msgs = user_dict[uid].gettMsg()  # 返回所有消息列表 [{from_id:111,to_id:111.....},{},{}]
            return HttpResponse(json.dumps(msgs))  # 响应一个json格式字符串
        except Exception, e:
            print str(e)
    else:
        return HttpResponse('get message error')  # 没有用户ID则返回错误信息
