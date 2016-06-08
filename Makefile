SHELL = /bin/bash

.PHONY: install

install:
	@echo "Generating files to match the host User and Group IDs for the container..."
	@source .env.sh; rm -f Dockerfile; envsubst < "config/Dockerfile.template" > "Dockerfile";
	@source .env.sh; rm -f config/group.sh; envsubst < "config/group.sh.template" > "config/group.sh";
	@echo "Building containers..."
	@docker-compose up -d
