FROM    pytorch/pytorch:0.4.1-cuda9-cudnn7-devel

ARG     DEBIAN_FRONTEND=noninteractive
ENV     LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN     apt-get update && \
        apt-get install -y build-essential && \
        apt-get install -y libgl1 libglib2.0-0 libxrender1 libsm6 && \
        pip install --upgrade pip

COPY    requirements.txt ./

RUN     pip install -r requirements.txt

COPY    . /src
WORKDIR /src

RUN	cd datasets/pycocotools && make
