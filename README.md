
# Covid-19 Chest X-ray Classifier

An automated machine learning model to assist in the diagnosis of COVID-19 infection in chest x-ray images

## Table of Contents
- [Introduction](#introduction)
- [Dataset](#Dataset)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Project Workflow](#project-Workflow)
- [Installation](#installation)
- [Usage](#usage)
- [Setup Jenkins in EC2](https://github.com/Komalsai234/Covid-19-Chest-X-ray-Classifier/blob/main/jenkins-setup/setup.md)

- [Data Pipeline](#data-pipeline)
- [Model Training](#model-training)
- [Model Evaluation](#model-evaluation)
- [CI/CD Pipeline](#cicd-pipeline)

## Introduction
This project aims to classify Covid-19 using Chest X-ray images. The project is modular and employs various tools and techniques to ensure scalability, reproducibility, and maintainability. It uses DVC for tracking model pipelines, MLflow for tracking metrics, and Jenkins for CI/CD implementation. The project is containerized using Docker and deployed on AWS EC2 instances.

## Dataset
The Dataset used for training the model is taken from Kaggle which consist of 4044 Covid and 5500 Normal/Non-Covid Chest X-rays. The link for the dataset can be find here

https://www.kaggle.com/datasets/amanullahasraf/covid19-pneumonia-normal-chest-xray-pa-dataset

## Technologies Used
- **DVC**: For tracking model pipelines.
- **MLflow**: For tracking experiment metrics and parameters.
- **Docker**: For containerization.
- **Jenkins**: For CI/CD pipeline.
- **Streamlit**: For creating the web app interface.
- **AWS EC2**: For deployment.

### Prerequisites
- Python 3.9 or higher
- Docker
- DVC
- MLflow
- Jenkins
- AWS Account

### Project Workflow

### Installation
1. **Clone the repository**
    ```bash
    git clone https://github.com/Komalsai234/Covid-19-Chest-X-ray-Classifier.git
    ```

2. **Install dependencies**
    ```bash
    pip install -r requirements.txt
  
## Usage
1. **Run the main script**
    ```bash
    python main.py
    ```

2. **Access the Streamlit app**
    Navigate to `http://localhost:8501` in your web browser.

## Data Pipeline
The data pipeline consists of the following stages:
- **Data Ingestion**: Load and preprocess the chest X-ray images.
- **Prepare Base Model**: Initialize and prepare the base model architecture.
- **Model Training**: Train the model using the preprocessed data.
- **Model Evaluation**: Evaluate the model's performance.

These stages are defined in the `dvc.yaml` file and are tracked using DVC.

## Model Training
The model training script is located in the `src/Covid_19/components` directory. It includes:
- Data loading and preprocessing.
- Model architecture definition.
- Training loop with validation.
- Checkpointing and logging with MLflow.

## Model Evaluation
The model evaluation script, located in the `src/Covid_19/components` directory, evaluates the trained model on a separate test dataset. It logs metrics such as accuracy and loss to MLflow for tracking.

## CI/CD Pipeline
The CI/CD pipeline is set up using Jenkins and is defined in the `.jenkins` directory. The pipeline includes:
- Building the Docker image.
- Running tests.
- Pushing the Docker image to a container registry.
- Deploying the Streamlit app on an AWS EC2 instance.

