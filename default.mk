# This file is part of the Housing Cooperative.
#
# Copyright (c) 2022 Serghei Iakovlev
#
# For the full copyright and license information, please view
# the LICENSE file that was distributed with this source code.

ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SHELL    := $(shell which bash)

FLASK_APP  := app.py
FLASK_ENV  := development
FLASK_HOST := 127.0.0.1
FLASK_PORT := 5000

PKG_NAME = housing-cooperative

ifneq ($(TERM),)
	GREEN := $(shell tput setaf 2)
	RESET := $(shell tput sgr0)
	CS = "${GREEN}~~~ "
	CE = " ~~~${RESET}"
else
	CS = "~~~ "
	CE = " ~~~"
endif

REQUIREMENTS = requirements/requirements.txt

ifneq ($(VIRTUAL_ENV),)
	PYTHON = $(VIRTUAL_ENV)/bin/python
else
	PYTHON ?= python3
endif

PIP = $(PYTHON) -m pip
