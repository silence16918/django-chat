# coding:utf8
from django.db import models
from django.contrib.auth.models import User


# Create your models here.

# 用户扩展信息表
class UserProfile(models.Model):
    nick = models.CharField(max_length=30)  # 昵称
    user = models.OneToOneField(User)  # 跟User表建立一对一的关系
    friends = models.ManyToManyField('self', blank=True)  # 跟自己建立一个多对多的关系

    def __unicode__(self):
        return self.nick
