SHELL = /bin/bash

.PHONY: install

install:
	@echo "Generating files to match the host User and Group IDs for the container..."
	@source .env.sh; rm -f Dockerfile; CONTAINER_VARS='$$HOST_USER_ID:$$HOST_GROUP_ID:$$HOST_USER'; envsubst "$$CONTAINER_VARS" < "config/Dockerfile.template" > "Dockerfile";
	@source .env.sh; rm -f config/group.sh; CONTAINER_VARS='$$HOST_GROUP_ID:$$HOST_USER'; envsubst "$$CONTAINER_VARS" < "config/group.sh.template" > "config/group.sh";
	@echo "Building containers..."
	@docker-compose up -d
