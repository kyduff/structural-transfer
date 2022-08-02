FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime

RUN apt-get -y update
RUN apt-get -y install wget vim

RUN pip install --upgrade pip

ENV EDITOR vim

# Create user
ARG UID
ARG GID
ARG UNAME
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
