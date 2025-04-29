FROM python:3.13.3-slim

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description="Run app.py"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PYTHON_FILE_NAME=app

RUN apt-get update

RUN python -m venv venv
RUN . venv/bin/activate && python -m pip freeze > requirements.txt && deactivate

COPY init.sh init.sh
COPY "$PYTHON_FILE_NAME".py "$PYTHON_FILE_NAME".py

RUN chmod +x init.sh

ENTRYPOINT [ "./init.sh" ]
