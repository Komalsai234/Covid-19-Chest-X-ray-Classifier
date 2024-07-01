import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import img_to_array
import os
import cv2

class PredictionPipeline:
    def __init__(self, image_array):
        self.image_array = image_array

    def predict(self):
        # load model
        model = load_model(os.path.join("model", "model.h5"))

        test_image = self.image_array
        test_image = cv2.resize(test_image, (224, 224))  # resize image to 224x224
        test_image = img_to_array(test_image)
        test_image = np.expand_dims(test_image, axis=0)

        result = np.argmax(model.predict(test_image), axis=1)

        if result[0] == 1:
            prediction = 'Covid-19'
        else:
            prediction = 'Normal'
        return [{ "image" : prediction}]
