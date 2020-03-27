
GIT_VERSION  = v1.0.0
GIT_COMMIT   = $(shell git rev-parse HEAD)
BUILD_DATE   = $(shell date +"%Y-%m-%dT%H:%m:%SZ")

GO_MODULE = $(or $(word 2, $(shell grep -m 1 . go.mod)),$(value 2) )

## command
GO           = go
GO_VENDOR    = go mod
MKDIR_P      = mkdir -p

################################################

.PHONY: build
build:
	GO111MODULE=on $(GO) build -mod=vendor -v -o sample \
	-ldflags "-X '$(GO_MODULE)/version.GitVersion=$(GIT_VERSION)' -X '$(GO_MODULE)/version.GitCommit=$(GIT_COMMIT)' \
	-X '$(GO_MODULE)/version.BuildDate=$(BUILD_DATE)'" \
	./example/...
