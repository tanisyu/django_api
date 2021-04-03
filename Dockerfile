FROM python:3.9
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY /django_tutorial/requirements.txt /code
RUN pip install -r requirements.txt
COPY /django_tutorial /code
