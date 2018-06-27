# Face recognition for Docker on Raspberry

Docker Image for [face_recognition](https://github.com/ageitgey/face_recognition) on Raspberry Pi
Based on https://github.com/denverdino/face_recognition_pi


### *License*
This software is released under the Apache 2.0 license.

## Getting started

Build container: 

```bash
docker build -t facerec:latest .
```

Run container:

```bash
docker run -it --device /dev/vchiq -v $PWD/beispiel.py:/face_recognition/examples/beispiel.py -v $PWD/bilder:/face_recognition/examples/bilder facerec bash
```
