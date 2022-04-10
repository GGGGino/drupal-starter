VERSION=1.0

.PHONY: clean build7.4 build8.0

build7.4:
	@docker build -t ggggino/drupal-starter:$(VERSION)-7.4 .
	@docker push ggggino/drupal-starter:$(VERSION)-7.4

build8.0:
	@docker build -t ggggino/drupal-starter:$(VERSION)-8.0 .
	@docker push ggggino/drupal-starter:$(VERSION)-8.0