FROM python:3.9-slim-buster

RUN apt update -y && apt install awscli -y
WORKDIR /app

COPY . /app

RUN git clone https://github.com/streamlit/streamlit-example.git .

RUN pip install -r requirements.txt

ENTRYPOINT ["streamlit", "run", "streamlit_app.py"]