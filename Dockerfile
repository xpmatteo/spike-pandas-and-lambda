FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y python python-pip
RUN pip install --upgrade pip
RUN pip install Flask
COPY hello.py .






