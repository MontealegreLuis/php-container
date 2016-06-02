SHELL = /bin/bash

.PHONY: install

install:
	@echo "Generating User and Group IDs for the container..."
	@sed -e s/{{CODEUP_USER}}/$(CODEUP_USER)/ config/.user.template > config/.user.tmp && sed -e s/{{CODEUP_GROUP}}/$(CODEUP_GROUP)/ config/.user.tmp > config/.user && rm config/.user.tmp
	@echo "Building containers..."
	@docker-compose up
