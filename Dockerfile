# pull official base image
FROM python:3.9

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN apt-get update
RUN pip install uwsgi

ENV STATIC_PATH /app/static
ENV APP_FOLDER /app
ENV Environment Prod
ENV SQLALCHEMY_DATABASE_URI postgresql://sna_user:sna_password@db:5432/sna_project

# set work directory
WORKDIR /app

USER $MOD_WSGI_USER:$MOD_WSGI_GROUP

# install dependencies
COPY ./requirements.txt .
RUN pip3 install -r /app/requirements.txt

# Copy files
COPY __init__.py main.py config.py login_page.py models.py schemas.py ./
COPY static ./static

EXPOSE 5000

ENV FLASK_APP=__init__.py