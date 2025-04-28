FROM python:3.13.3-slim

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description="Run app.py"

WORKDIR /usr/src/app

ENV SHELL_FILE_NAME=init
ENV PYTHON_FILE_NAME=app
ENV REQUIREMENTS_FILE_NAME=requirements
ENV VENV_PATH=venv

COPY "$SHELL_FILE_NAME".sh "$SHELL_FILE_NAME".sh
COPY "$PYTHON_FILE_NAME".py "$PYTHON_FILE_NAME".py

RUN apt-get update

RUN python -m venv "$VENV_PATH"
RUN . "$VENV_PATH"/bin/activate
RUN pip install --upgrade pip
RUN pip freeze > "$REQUIREMENTS_FILE_NAME".txt
RUN deactivate

ENTRYPOINT [ "dash", "init.sh" ]
