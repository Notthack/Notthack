# NourishChain local demo helpers
# Usage:
#   make demo      - build Flutter web and start the Node backend
#   make build-web - build the Flutter web app
#   make start     - start the Node backend only
#   make test      - run acceptance checks
#   make clean     - remove Flutter web build output and cache

SHELL := /bin/bash

APP_DIR := mealtrust_app
WEB_BUILD := $(APP_DIR)/build/web/index.html

.PHONY: help demo build-web start test clean

help:
	@echo "Targets:"
	@echo "  make demo      - build Flutter web and start the Node backend"
	@echo "  make build-web - build the Flutter web app"
	@echo "  make start     - start the Node backend only"
	@echo "  make test      - run acceptance checks"
	@echo "  make clean     - remove Flutter web build output and cache"

demo: build-web start

build-web:
	cd $(APP_DIR) && flutter build web

start:
	npm start

test:
	npm run test:acceptance

clean:
	cd $(APP_DIR) && flutter clean
