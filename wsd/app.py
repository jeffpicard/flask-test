from flask import Flask
from flask import render_template
from flask import request
from nltk.wsd import lesk

app = Flask(__name__)

@app.route('/')
def root():
    return 'Nothing here :('

@app.route('/wsd', methods=("GET", "POST"))
def wsd():
    definition = ""
    if request.method == "POST":
        word = request.form["word"]
        sentence = request.form["sentence"]
        if word and sentence and word in sentence:
            definition = lesk(sentence, word).definition()
    return render_template("main.html", definition=definition)
