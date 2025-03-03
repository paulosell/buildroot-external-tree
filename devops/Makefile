PHONY: all build 

all: build 

build:
	docker build --tag $(ORG)/$(REPOSITORY):$(COMMIT) .
	@docker tag $(ORG)/$(REPOSITORY):$(COMMIT) $(ORG)/$(REPOSITORY):$(TAG)

	
