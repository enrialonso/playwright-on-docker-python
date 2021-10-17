SHELL=/bin/bash

build-all-browsers-image:
	docker build --pull --rm -t playwright-docker .

run-all-browsers-image:
	docker run --rm -it --name playwright-docker playwright-docker

build-chromium-image:
	docker build --pull --rm -t playwright-chromium -f ./chromium/Dockerfile.chromium .

run-chromium-image:
	docker run --rm -it --name playwright-chromium playwright-chromium

build-firefox-image:
	docker build --pull --rm -t playwright-firefox -f ./firefox/Dockerfile.firefox .

run-firefox-image:
	docker run --rm -it --name playwright-firefox playwright-firefox

prune-system:
	docker system prune -f