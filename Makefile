# This file is part of the Housing Cooperative.
#
# Copyright (c) 2022 Serghei Iakovlev
#
# For the full copyright and license information, please view
# the LICENSE file that was distributed with this source code.

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SHELL    := $(shell which bash)

APPLICATION := app.py

.PHONY: serve
serve: $(APPLICATION)
	FLASK_APP=$? FLASK_ENV=development flask run
