help:								## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

build: 							## Build the docker image.
	docker build -t stefanwalther/jsdoc2md .
.PHONY: build

run:
	docker run --rm --tty -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md /bin/bash
.PHONY: run

test:								## Run tests
	docker run --rm --tty -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md test/fixtures/index.js > test/.tmp/index.md
	docker run --rm --tty -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md test/fixtures/async.js > test/.tmp/async.md
.PHONY: test

gen-readme:					## Generate the README.md
	npm run docs
.PHONY: test

exec:
	docker exec -v ${PWD}:/opts/jsdoc2md -it stefanwalther/jsdoc2md /bin/bash
.PHONY: exec
