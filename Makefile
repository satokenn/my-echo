NAME := my-echo
REPOSITORY := ysakashita/$(NAME)
TAG := 20240710
GOOS := linux
GOARCH := amd64

.PHONY: build test image-build image-push clean
build:
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o _output/$(NAME) .

test:
	go test -v

image-build:
	docker build -t $(REPOSITORY):$(TAG) .

image-push:
	docker push $(REPOSITORY):$(TAG)

clean:
	rm -rf _output
