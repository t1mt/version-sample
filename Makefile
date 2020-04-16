
tag = $(shell git describe --dirty --always --tags | sed 's/-/./2' | sed 's/-/./2')
GIT_VERSION = $(if $(word 2, $(subst -g, ,$(tag))), $(tag), "1.0.0")
GIT_COMMIT  = $(shell git rev-parse HEAD)
BUILD_DATE  = $(shell date +"%Y-%m-%dT%H:%m:%SZ")
GO_MODULE   = $(word 2, $(shell grep -m 1 . go.mod) )
GO_LDFLAGS  = -X '$(GO_MODULE)/version.GitVersion=$(GIT_VERSION)' -X '$(GO_MODULE)/version.GitCommit=$(GIT_COMMIT)' -X '$(GO_MODULE)/version.BuildDate=$(BUILD_DATE)'

## command
GO         = go
GO_VENDOR  = go mod

MKDIR_P = mkdir -p
CMD = sample

################################################
all: test build run clean

.PHONY: test
test:
	@echo "=========================="
	@echo $(GIT_VERSION)
	@echo $(GIT_COMMIT)
	@echo $(BUILD_DATE)
	@echo $(GO_MODULE)

.PHONY: build
build:
	@echo "=========================="
	GO111MODULE=on $(GO) build -mod=vendor -v -o $(CMD) \
	-ldflags "$(GO_LDFLAGS)" \
	./example/...

.PHONY: run
run:
	@echo "=========================="
	./${CMD}

.PHONY: clean
clean:
	@echo "=========================="
	rm -rf ./${CMD}
