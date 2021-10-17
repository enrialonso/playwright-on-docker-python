# playwright-on-docker-python

I needed a docker image to run the playwright scripts, the problem I had was that I needed it to run on 
`headless == False` and using` Xvfb`. With this repository you can do this without problem and apart from having an 
image for a specific browser such as Chromium or Firefox.

### Usage

### All `Makefile` commands
```makefile
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
```

### For all browsers

```bash
$ make build-all-browsers-image
...
$ make run-all-browsers-image
```

Output
```bash
chromium >>> Fast and reliable end-to-end testing for modern web apps | Playwright
firefox >>> Fast and reliable end-to-end testing for modern web apps | Playwright
```

### Important 

For run scripts inside de container and `headless==False` need put before the run command `xvfb-run`, this command enable
playwright to open a window browser. [Playwright Documentation about **Xvfb**](https://playwright.dev/python/docs/ci/#running-headed)

Make with ❤️ 