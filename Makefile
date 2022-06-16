ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SHELL    := $(shell which bash)

APPLICATION := app.py

.PHONY: serve
serve: $(APPLICATION)
	FLASK_APP=$? FLASK_ENV=development flask run
