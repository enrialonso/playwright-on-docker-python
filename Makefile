SHELL=/bin/bash
.ONESHELL:

build-image:
	docker build --pull --rm -t playwright-docker "."

run-image:
	docker run --rm -it --name playwright playwright-docker

build-and-run:
	make build-image
	make run-image