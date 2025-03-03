export REPOSITORY := buildroot
export ORG ?= paulosell
export TAG ?= latest
export IMAGE_URL := $(SERVER)/$(ORG)/$(REPOSITORY)
export COMMIT := $(shell git log --format=%h -n1)
export BR_PATH ?= "/home/devops/buildroot"

image:
	docker run --rm -v $$PWD:$(BR_PATH) $(ORG)/$(REPOSITORY):$(TAG) sh /home/devops/buildroot/scripts/build_image.sh clean_build

run_container:
	docker run --rm -it -v $$PWD:$(BR_PATH) $(ORG)/$(REPOSITORY):$(TAG) /bin/bash

build_container:
	$(MAKE) -C devops build
