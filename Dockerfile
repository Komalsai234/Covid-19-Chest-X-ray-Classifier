FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && apt-get clean

RUN pip install --upgrade pip setuptools

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /app

WORKDIR /app

CMD ["streamlit run", "app.py"]
