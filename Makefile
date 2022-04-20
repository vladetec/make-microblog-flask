define USAGE
Super awesome hand-crafted build system ⚙️
By Vladetec.

Commands:
  create    create project directories and files.
	init      Install Python dependencies with venv
	# test      # Run linters, test db migrations and tests.
	serve     Run app in dev environment.
endef

export USAGE
help:
	@echo "$$USAGE"

create:
  mkdir templates static
  touch app.py database.py

init:
  python3.10 -m venv venv
  source venv/bin/activate
	pip install -U pip
  pip install -U setuptools wheel
  pip install Flask==2.0.2 Flask-Migrate==2.5.0 Flask-Script==2.0.5 Flask-SQLAlchemy==2.5.1
	

#test:
	#pipenv run yapf -irp flask-example tests
	#pipenv run flake8 --max-line-length=120 flask-example tests
	#pipenv run pytest --junitxml=pytest.xml --cov-config .coveragerc --cov flask-example --cov-report term

serve:
	export FLASK_APP=app && export FLASK_ENV=1 && flask run
