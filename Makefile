PANDOC_VERSION = 2.11.3.2
JEKYLL_VERSION = 4.2.0

build : Dockerfile
	docker build --pull \
		--build-arg pandoc_version=$(PANDOC_VERSION) \
		--build-arg jekyll_version=$(JEKYLL_VERSION) \
		-t palazzo/jekyll-pandoc:$(JEKYLL_VERSION)-$(PANDOC_VERSION) \
		.
