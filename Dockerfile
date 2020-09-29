# set the base image 
FROM python:2.7
# File Author / Maintainer
MAINTAINER Esther
#add project files to the usr/src/app folder
ADD . /usr/src/app
#set directoty where CMD will execute 
WORKDIR /usr/src/app
COPY requirements.txt ./
# Get pip to download and install requirements:
RUN pip install --no-cache-dir -r requirements.txt
# Expose ports
EXPOSE 8000
# default command to execute 
WORKDIR /usr/src/app/minimal-django   
CMD python minimal.py runserver  0.0.0.0:8000
