
# coding: utf-8

# In[335]:

import numpy as np


# In[336]:

import pandas as pd


# In[337]:

import matplotlib.pyplot as pp


# In[338]:

import mysql.connector


# In[359]:

import csv


# In[ ]:

conn=mysql.connector.connect(user='root',password='newpass123',host='localhost',database='shares')


# In[ ]:

mycursor=conn.cursor()


# In[368]:

file ='/home/saibotta/Downloads/holdings.csv'
holdings = pd.read_csv(file)


# In[381]:

i=0


# In[383]:

for holding in holdings['Instrument'] :
    #i=i+1
    #pp.subplot(4,4,i)
    mycursor.execute("select tradedqty,nooftrades,last,date from shares.bhavdata where symbol =\'"+holding+"\'")
    rows=mycursor.fetchall()
    volumeData=np.array(rows)
    dates=volumeData[:,3]
    fig, ax1 = pp.subplots()
    ax1.plot(dates, volumeData[:,2], 'b-')
    ax1.tick_params('y', colors='b')
    ax2 = ax1.twinx()
    ax2.plot(dates, volumeData[:,0], 'r-')
    ax2.tick_params('y', colors='r')
    pp.title(holding)
    pp.show()


# In[348]:

volume_df = pd.DataFrame({'price':priceData[:,0]})


# In[349]:

volume_df.price.is_monotonic_decreasing


# In[350]:

volume_df.price.is_monotonic_increasing


# In[351]:

volume_df.price.describe()


# In[ ]:



