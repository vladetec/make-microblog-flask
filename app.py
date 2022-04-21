from datetime import datetime
from flask import Flask, render_template, request
import database
hoje = datetime.today().strftime("%d/%b/%Y - %H:%M:%S")

app = Flask(__name__)

database.create_tables()


@app.route("/", methods=["GET", "POST"])
@app.route("/home", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        entry_content = request.form.get("content").capitalize()
        database.create_entry(
            entry_content, hoje)

    return render_template("home.html", entries=database.retrieve_entries())
