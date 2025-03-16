export REPOSITORY := buildroot
export ORG ?= paulosell
export TAG ?= latest
export IMAGE_URL := $(SERVER)/$(ORG)/$(REPOSITORY)
export COMMIT := $(shell git log --format=%h -n1)
export BR_PATH ?= "/home/devops/buildroot"

image_clean_build:
	docker run --rm -v $$PWD:$(BR_PATH) $(ORG)/$(REPOSITORY):$(TAG) sh /home/devops/buildroot/scripts/build_image.sh clean_build

image_dirty_build:
	docker run --rm -v $$PWD:$(BR_PATH) $(ORG)/$(REPOSITORY):$(TAG) sh /home/devops/buildroot/scripts/build_image.sh dirty_build


run_container:
	docker run --rm -it -v $$PWD:$(BR_PATH) $(ORG)/$(REPOSITORY):$(TAG) /bin/bash

build_container:
	$(MAKE) -C devops build

burn_sd_card:
	sh scripts/burn_sd.sh
