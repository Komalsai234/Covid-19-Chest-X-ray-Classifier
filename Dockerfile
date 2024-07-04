FROM python:3.9-slim-buster

ENV HOST=0.0.0.0
ENV LISTEN_PORT=8080

EXPOSE 8080

RUN apt-get update && apt-get install -y git

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

CMD ["streamlit", "run", "demo_app/main.py", "--server.port", "8080"]