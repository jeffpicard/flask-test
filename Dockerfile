FROM python:3.8.2-buster

WORKDIR /usr/src/app

COPY . .
CMD ["echo", "hello world"]
