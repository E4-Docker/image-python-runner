FROM python:3.13.3-slim

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description="Run app.py"

WORKDIR /usr/src/app

RUN apt-get update

RUN python -m venv venv
RUN source venv/Scripts/activate
RUN pip freeze > requirements.txt
RUN deactivate

COPY init.sh init.sh
COPY app.py app.py

ENV PYTHON_FILE_NAME="app"

ENTRYPOINT [ "dash", "init.sh" ]
