FROM python:3.8.2-buster

WORKDIR /usr/src/app

COPY . .
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile
EXPOSE 5000
ENV FLASK_APP "./flaskr/app.py"

CMD ["flask", "run", "--host=0.0.0.0"]
