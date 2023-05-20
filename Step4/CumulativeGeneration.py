

import mysql.connector
from mysql.connector import errorcode

import numpy as np
import pandas as pd

import matplotlib.pyplot as plt

def connectionCreator():
    try:
        # Local instance 3306
        connection = mysql.connector.connect(user="root", password="11111111", database="ShareOfEnergyGeneration")
        print("Connected.")
        return connection
    except mysql.connector.Error as errcd:
        print("Error:",errcd)

query = """SELECT * 
FROM annual_generation
WHERE generation_fossil IS NOT NULL AND generation_renewables IS NOT NULL
"""
conobj = connectionCreator()
df = pd.read_sql(query, conobj)
conobj.close()

cumdf = df.groupby("iso_code")["generation_total"].sum().reset_index()
fdf = cumdf[cumdf["generation_total"] > 1500].sort_values(by="generation_total", ascending=True)

plt.barh(fdf["iso_code"], fdf["generation_total"])
plt.xlabel("Cumulative Generation")
plt.ylabel("Counties (ISO Codes)")
plt.title("Cumulative Generation of Every Country (Above 1.5PWH) (Logarithmic in TW Hours)")
plt.xscale("log")
plt.show()

