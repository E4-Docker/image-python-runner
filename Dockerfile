FROM python:3.13.3-slim

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description="Run app.py"

WORKDIR /usr/src/app

RUN apt-get update
RUN python -m venv venv

ENV REQUIREMENTS_FILE_NAME=requirements
ENV PYTHON_FILE_NAME=app
ENV VIRTUAL_ENV=/venv
ENV PATH=/venv/bin:$PATH

COPY init.sh init.sh
COPY "$PYTHON_FILE_NAME".py "$PYTHON_FILE_NAME".py
COPY "$REQUIREMENTS_FILE_NAME".txt "$REQUIREMENTS_FILE_NAME".txt

ENTRYPOINT [ "dash", "init.sh" ]
