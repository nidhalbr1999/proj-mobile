import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
%matplotlib inline
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.preprocessing.image import ImageDataGenerator


!git clone https://github.com/alexeygrigorev/clothing-dataset-small.git
  
  from tensorflow.keras.preprocessing.image import load_img 
from tensorflow.keras.applications.xception import Xception
from tensorflow.keras.applications.xception import preprocess_input
from tensorflow.keras.applications.xception import decode_predictions
from keras.layers import Activation, Dense

train=datagen.flow_from_directory("/content/clothing-dataset-small/train",  
                                    target_size=(224, 224), 
                                    color_mode='rgb',
                                    shuffle=True,
                                    seed=42,
                                    class_mode='categorical', 
                                    batch_size=32,
                                    subset="training"
)
validation=datagen.flow_from_directory(  "/content/clothing-dataset-small/validation",  
                                    target_size=(224, 224), 
                                    shuffle=True,
                                    seed=42,
                                    color_mode='rgb', 
                                    class_mode='categorical', 
                                    batch_size=32,
                                    subset='validation'
)

class_names = list(train.class_indices.keys())
class_names =['dress',
 'hat',
 'longsleeve',
 'outwear',
 'pants',
 'shirt',
 'shoes',
 'shorts',
 'skirt',
 't-shirt']
from tensorflow import keras
base_model = keras.applications.VGG16(
    weights='imagenet',  # Load weights pre-trained on ImageNet.
    input_shape=(224, 224, 3),
    include_top=False)
base_model.summary()


base_model.trainable = False#freezing
inputs = keras.Input(shape=(224, 224, 3))
# Separately from setting trainable on the model, we set training to False 
x = base_model(inputs, training=False)
x = keras.layers.GlobalAveragePooling2D()(x)
# A Dense classifier with 10 units 
outputs = Dense(10, activation='softmax')(x)
model = keras.Model(inputs, outputs)


model.compile(loss = 'categorical_crossentropy',optimizer='Adam',metrics=['accuracy'])
from keras.callbacks import ModelCheckpoint, EarlyStopping
import os
checkpoint_path = "./training_1/cp.ckpt"
checkpoint_dir = os.path.dirname(checkpoint_path)
cp_callback = tf.keras.callbacks.ModelCheckpoint(filepath=checkpoint_path,
                                                 save_weights_only=True,
                                                 verbose=1)
my_callbacks  = [EarlyStopping(monitor='val_loss',
                              min_delta=0,
                              patience=3,
                              mode='auto')]
history = model.fit(
    train,
    validation_data=validation,
    epochs=50,
    callbacks=[cp_callback,my_callbacks],
    verbose=1
)
import numpy as np 
import cv2 as cv
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from tensorflow.keras.preprocessing import image as image_utils
from tensorflow.keras.applications.imagenet_utils import preprocess_input

def show_image(image_path):
    image = mpimg.imread(image_path)
    plt.imshow(image)



    



def make_predictions(image_path):
    show_image(image_path)
    image = image_utils.load_img(image_path, target_size=(224, 224))
    image = image_utils.img_to_array(image)
    image = image.reshape(1,224,224,3)
    image = preprocess_input(image)
    preds = model.predict(image)
    pre = class_names[np.argmax(preds)]
    return pre
  
 # test   
path = '/content/images (1).jfif'
make_predictions(path)




