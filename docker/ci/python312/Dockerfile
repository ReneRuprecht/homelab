FROM python:3.12-alpine3.22

RUN mkdir ~/.ssh

RUN pip install \
    pipenv \
    pyyaml 

RUN apk add \
    tar \ 
    jq \
    unzip \
    openssh \
    openssl \
    git

