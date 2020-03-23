FROM python:3.8.2-buster

WORKDIR /usr/src/app

COPY . .
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile
RUN python -c "import nltk; nltk.download('wordnet')"
EXPOSE 5000
ENV FLASK_APP "./wsd/app.py"

CMD ["flask", "run", "--host=0.0.0.0"]
