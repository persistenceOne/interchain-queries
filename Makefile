.PHONY: build

version ?= latest

build:
	go build -o new-icq

docker:
	docker build -f Dockerfile . -t quicksilverzone/interchain-queries:${version}

docker-local:
	go build
	docker build -f Dockerfile.local . -t quicksilverzone/interchain-queries:${version}

docker-push:
	docker push quicksilverzone/interchain-queries:${version}
