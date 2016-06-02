SHELL = /bin/bash

.PHONY: install

install:
	@echo "Generating files to match the host User and Group IDs for the container..."
	@sed -e s/{{CODEUP_USER}}/$(CODEUP_USER)/ config/Dockerfile.template > Dockerfile.tmp && sed -e s/{{CODEUP_GROUP}}/$(CODEUP_GROUP)/ Dockerfile.tmp > Dockerfile && rm Dockerfile.tmp
	@sed -e s/{{CODEUP_GROUP}}/$(CODEUP_GROUP)/ config/group.sh.template > config/group.sh && chmod a+x config/group.sh
	@echo "Building containers..."
	@docker-compose up -d

