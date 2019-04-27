import sys

import pymysql
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime

import  os
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5 import QtCore,QtGui,QtSql
from UI_客户端数据分析 import *

db = pymysql.connect(host='localhost', user='root', passwd='jp365gl', db='test', use_unicode=True,
                    charset='utf8')
cursor = db.cursor()




plt.rcParams['font.family'] = ['sans-serif']
plt.rcParams['font.sans-serif'] = ['SimHei']
# 设置matplotlib显示中文

class MyWindow(QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        super(MyWindow, self).__init__(parent)
        self.setupUi(self)
        #self.Att_comboBox.addItems(['小盘1310','小盘1383','小盘1550'])
        self.device_bh_comboBox.addItems(['{:0>2d} '.format(x) for x in range(1, 49)])
        #self.show_comboBox.addItems(['芯棒编号', '小盘检验周', '小盘检验月', '芯棒烧结周', '芯棒烧结月'])

    def date_M(self,dates):
        #pd.to_datetime(dates)
        return datetime.strftime(dates, format='%y-%m')
    def date_W(self,dates):
        #pd.to_datetime(dates)
        return datetime.strftime(dates, format='%y-%V')

    def test(self):
        sql = "SELECT xp1383,xp1310,xp1550,XPJCRQ,CJXH,left(XBBH,11) as XBBH,SJXH FROM xblssjgxhzb WHERE 1=1 "
        if self.checkBox_4.isChecked()==True:
            sql=sql+" and XBGC = '"+self.xbgc_comboBox.currentText()+"'"
            print(sql)
        if self.checkBox.isChecked()==True:
            sql=sql+" and SJXH ='"+self.device_bh_comboBox.currentText()+"'"
            print(sql)
        if self.checkBox_5.isChecked()==True:
            sql=sql+" and SFYB ='否'"
            print(sql)

        sql2 = "SELECT left(ccwp,11) as XBBH ,JWJSSJ FROM soot_time"
        df1 = pd.read_sql(sql, db, coerce_float=True)
        df2= pd.read_sql(sql2, db, coerce_float=True)
        df=pd.merge(df1,df2,how='left',left_on='XBBH',right_on='XBBH')

        en_zh={'xp1383': '小盘1383','xp1310': '小盘1310','xp1550': '小盘1550','JWJSSJ': '芯棒烧结日期','XBBH': '芯棒编号','XPJCRQ':'小盘检验日期'}
        df.rename(columns=en_zh, inplace=True)
        print(df)
        print(list(df.columns))  # 获取列名

        if self.show_comboBox.currentText() in ['月','周'] and self.device_comboBox.currentText() in ['芯棒烧结']:
            df=df[df['芯棒烧结日期'].notnull()] #去除无芯棒烧结时间的数据
            df['芯棒烧结月'] = df['芯棒烧结日期'].apply(pd.to_datetime).apply(self.date_M)
            df['芯棒烧结周'] = df['芯棒烧结日期'].apply(pd.to_datetime).apply(self.date_W)
            print('芯棒烧结日期')
        if self.show_comboBox.currentText() in ['月','周'] and self.device_comboBox.currentText() in ['小盘检验'] :
            df=df[df['小盘检验日期'].notnull()] #去除无芯棒烧结时间的数据
            df['小盘检验月'] = df['小盘检验日期'].apply(pd.to_datetime).apply(self.date_M)
            df['小盘检验周'] = df['小盘检验日期'].apply(pd.to_datetime).apply(self.date_W)
            print('小盘检验日期')
        titles=self.device_comboBox.currentText()+self.device_bh_comboBox.currentText()+self.show_comboBox.currentText()+self.Att_comboBox.currentText()
        #plt.figure(titles)
        df.boxplot(column=[self.Att_comboBox.currentText()], by=[self.device_comboBox.currentText()+self.show_comboBox.currentText()], rot=-90,figsize=(10,6))
        plt.grid(linestyle="--", alpha=0.3)
        plt.ylim(0.2, 0.40)
        plt.yticks(np.arange(0.2, 0.40, step=0.005))
        # plt.xticks(rotation=-90)
        plt.tight_layout()
        plt.ylabel('衰减系数')

        plt.xlabel(self.device_comboBox.currentText()+self.show_comboBox.currentText())

        plt.title(titles)
        plt.show()
        print(self.Att_comboBox.currentText())


if __name__ == '__main__':
    app = QApplication(sys.argv)
    myWin = MyWindow()
    myWin.show()
    sys.exit(app.exec_())