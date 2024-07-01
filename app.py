import streamlit as st
import numpy as np
import cv2
from Covid_19.pipeline.prediction import PredictionPipeline

st.title("Covid-19 Chest X-ray Classifier")

st.sidebar.title("Created By:")
st.sidebar.subheader("P.Komal Sai Anurag")
st.sidebar.subheader(" ")

st.sidebar.image("https://post.healthline.com/wp-content/uploads/2020/08/chest-x-ray_thumb.jpg", width=None)

upload_file = st.file_uploader("Upload the Chest X-ray", type=['jpg', 'png', 'jpeg'])

generate_pred = st.button("Predict")

if generate_pred:
    if upload_file is not None:
        image = cv2.imdecode(np.frombuffer(upload_file.read(), np.uint8), 1)
        with st.expander('image', expanded=True):
            st.image(image, use_column_width=True)
        pred = PredictionPipeline(image).predict()
        labels = ['Normal', 'Tumor']
        st.title(f"The Chest X-ray is {labels[np.argmax(pred)]}")
    else:
        st.error("Please upload an image file.")
