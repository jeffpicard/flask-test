FROM python:3.8.2-buster

WORKDIR /usr/src/app

COPY . .
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile
RUN python -c "import nltk; nltk.download('wordnet')"
RUN python -c "import nltk; nltk.download('averaged_perceptron_tagger')"
RUN python -c "import nltk; nltk.download('punkt')"

EXPOSE 5000
ENV FLASK_APP "./wsd/app.py"

CMD ["flask", "run", "--host=0.0.0.0"]
