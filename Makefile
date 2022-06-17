# This file is part of the Housing Cooperative.
#
# Copyright (c) 2022 Serghei Iakovlev
#
# For the full copyright and license information, please view
# the LICENSE file that was distributed with this source code.

include default.mk

.PHONY: init
init: $(PYTHON)
	@echo $(CS)Set up environment$(CE)
	@$(PIP) install --upgrade pip
	@echo

.PHONY: install
install: $(REQUIREMENTS)
	@echo $(CS)Installing $(PKG_NAME) and all its dependencies$(CE)
	@$(PIP) install -r $(REQUIREMENTS)
	@echo

.PHONY: serve
serve: $(PYTHON)
	@echo $(CS)Starting web server on $(LOCAL_PORT) port$(CE)
	FLASK_APP=$(FLASK_APP) FLASK_ENV=$(FLASK_ENV) \
	    flask run --host $(FLASK_HOST) --port $(FLASK_PORT)

.PHONY: help
help:
	@echo $(PKG_NAME)
	@echo
	@echo 'Run "make init" first to install and update all dev dependencies.'
	@echo 'See "default.mk" for variables you might want to set.'
	@echo
	@echo 'Available targets:'
	@echo
	@echo '  help:         Show this help and exit'
	@echo '  init:         Set up environment (has to be launched first)'
	@echo '  install:      Install project and all its dependencies'
	@echo '  serve:        Run development server'
	@echo
	@echo 'Environment variables:'
	@echo
	@echo '  PYTHON:       $(PYTHON)'
	@echo '  VIRTUAL_ENV:  ${VIRTUAL_ENV}'
	@echo '  SHELL:        $(shell echo $$SHELL)'
	@echo '  TERM:         $(shell echo $$TERM)'
	@echo
