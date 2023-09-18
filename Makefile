.PHONY: build

version ?= latest

build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o linux-icq

build:
	go build 

docker:
	docker build -f Dockerfile . -t quicksilverzone/interchain-queries:${version}

docker-local:
	go build
	docker build -f Dockerfile.local . -t quicksilverzone/interchain-queries:${version}

docker-push:
	docker push quicksilverzone/interchain-queries:${version}
