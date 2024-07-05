FROM python:3.9-slim-buster

EXPOSE 8501

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg libsm6 libxext6 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Verify if streamlit is installed
RUN pip3 show streamlit

# Adding the location where pip installs binaries to PATH
ENV PATH="$HOME/.local/bin:$PATH"

# Symlink to /usr/local/bin
RUN ln -s /root/.local/bin/streamlit /usr/local/bin/streamlit

ENTRYPOINT ["streamlit"]
CMD ["run", "app/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
