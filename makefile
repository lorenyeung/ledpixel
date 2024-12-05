GOOS=linux
GOARCH=arm64
VERSION := $(shell jq -r '.script_version' metadata.json)
BINARY := $(shell jq -r '.binary_prefix' metadata.json)
.PHONY: build

GIT_COMMIT := $(shell git rev-list -1 HEAD)

buildlinux:
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(BINARY)-linux-x64 -ldflags "-X main.gitCommit=$(GIT_COMMIT) -X main.version=$(VERSION)" main.go
buildmac:
	GOOS=darwin GOARCH=$(GOARCH) go build -o $(BINARY)-darwin-x64 -ldflags "-X main.gitCommit=$(GIT_COMMIT) -X main.version=$(VERSION)" main.go
