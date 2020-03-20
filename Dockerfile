FROM python:3.8.2-buster

WORKDIR /usr/src/app

COPY . .
RUN pip install pipenv
RUN pipenv install --ignore-pipfile

CMD ["echo", "hello world"]
