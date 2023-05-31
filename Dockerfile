FROM golang:1.19-alpine as build

RUN apk add --no-cache curl make git libc-dev bash gcc linux-headers eudev-dev python3

WORKDIR /src/app

COPY go.mod go.mod
COPY go.sum go.sum

RUN go mod download

COPY . .

RUN go build

FROM alpine:edge

RUN apk add --update ca-certificates jq bash curl

COPY --from=build /src/app/interchain-queries /usr/local/bin/interchain-queries
