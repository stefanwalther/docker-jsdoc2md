help:								## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

build: 							## Build the docker image.
	docker build -t stefanwalther/jsdoc2md .
.PHONY: build

run:								## Run an interactive shell in the image.
	docker run --rm -it --entrypoint /bin/bash -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md
.PHONY: run

test:								## Run tests
	mkdir -p test/.tmp
	docker run --rm -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md test/fixtures/index.js > test/.tmp/index.md
	docker run --rm -v ${PWD}:/opt/jsdoc2md stefanwalther/jsdoc2md test/fixtures/async.js > test/.tmp/async.md
	diff -u test/expected/index.md test/.tmp/index.md
	diff -u test/expected/async.md test/.tmp/async.md
.PHONY: test

exec:								## Exec a shell in the running container.
	docker exec -it $$(docker ps -q --filter "ancestor=stefanwalther/jsdoc2md" | head -n 1) /bin/bash
.PHONY: exec
