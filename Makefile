SHELL = /bin/bash

.PHONY: install

install:
	@echo "Generating files to match the host User and Group IDs for the container..."
	@source .env.sh; rm -f Dockerfile; CONTAINER_VARS='$$HOST_USER_ID:$$HOST_GROUP_ID:$$HOST_USER'; envsubst "$$CONTAINER_VARS" < "config/Dockerfile.template" > "Dockerfile";
	@source .env.sh; rm -f config/group.sh; CONTAINER_VARS='$$HOST_GROUP_ID:$$HOST_USER'; envsubst "$$CONTAINER_VARS" < "config/group.sh.template" > "config/group.sh";
	@source .env.sh; rm -f bin/database.php; CONTAINER_VARS='$$CONTAINERS_PREFIX'; envsubst "$$CONTAINER_VARS" < "config/database.php.template" > "bin/database.php";
	@source .env.sh; rm -f config/.bashrc; CONTAINER_VARS='$$CONTAINER_HOSTNAME'; envsubst "$$CONTAINER_VARS" < "config/.bashrc.template" > "config/.bashrc";
	@source .env.sh; rm -f docker-compose.yml; CONTAINER_VARS='$$CONTAINERS_PREFIX:$$DB_ROOT_PASSWORD'; envsubst "$$CONTAINER_VARS" < "config/docker-compose.yml.template" > "docker-compose.yml";
	@echo "Building containers..."
	@docker-compose up -d
