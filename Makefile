.PHONY: build release dev

VERSION=usenix-eval-jul2023

build:
	docker pull ubuntu:20.04
	docker save -o ubuntu.tar ubuntu:20.04
	docker build -t greenhouse:${VERSION} .

release:
	docker pull ubuntu:20.04
	docker save -o ubuntu.tar ubuntu:20.04
	docker build --no-cache -t greenhouse:${VERSION} .

dev:
	docker build -t greenhouse:${VERSION} -f dev.Dockerfile .
