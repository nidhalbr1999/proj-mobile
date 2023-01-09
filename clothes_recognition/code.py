import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
%matplotlib inline
import tensorflow as tf
from tensorflow import keras
import os
import cv2
from tensorflow.keras.applications.xception import Xception
from tensorflow.keras.applications.xception import preprocess_input

from tensorflow.keras.preprocessing.image import load_img 
from tensorflow.keras.preprocessing.image import ImageDataGenerator

!wget https://github.com/alexeygrigorev/mlbookcamp-code/releases/download/chapter7-model/xception_v4_large_08_0.894.h5

model = keras.models.load_model('xception_v4_large_08_0.894.h5')
def decide_model(img):
  

  labels = {
    0: 'dress',
    1: 'hat',
    2: 'longsleeve',
    3: 'outwear',
    4: 'pants',
    5: 'shirt',
    6: 'shoes',
    7: 'shorts',
    8: 'skirt',
    9: 't-shirt'
  }
  weather = {
      'dress' :'suuny' ,
      'hat'  : 'sunny',
      'longsleeve' : 'cloudy',
      'outwear' : 'cloudy',
      'pants': 'sunny',
      'shirt': 'cloudy',
      'shoes': 'sunny',
      'shorts': 'sunny',
      'skirt' : 'sunny',
      't-shirt': 'sunny'
  }
  x = np.array(img)
  x.resize(299,299,3)
  X = np.array([x])
  X = preprocess_input(X)
  pred = model.predict(X)
  i= labels[pred[0].argmax()]
  j= weather [i]
  return (i,j)
