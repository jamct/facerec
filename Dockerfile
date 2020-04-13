#Dockerfile for face-recognition
#Based on https://github.com/denverdino/face_recognition_pi

FROM resin/raspberry-pi-python:3
COPY pip.conf /root/.pip/pip.conf
RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-dev \
    libavcodec-dev \
    libavformat-dev \
    libboost-all-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN pip install --upgrade pip

RUN python3 -m ensurepip --upgrade && pip3 install --upgrade picamera[array] dlib

RUN git clone --single-branch https://github.com/ageitgey/face_recognition.git
RUN cd /face_recognition && \
    pip3 install -r requirements.txt && \
    python3 setup.py install

CMD cd /face_recognition/examples && \
    python3 recognize_faces_in_pictures.py

