FROM python:3.13.3-slim

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description="Run app.py"

RUN apt-get update

WORKDIR /usr/src/app

COPY init.sh init.sh
COPY app.py app.py
COPY requirements.txt requirements.txt

ENV PYTHON_FILE_NAME="app"

ENTRYPOINT [ "sh init.sh" ]
