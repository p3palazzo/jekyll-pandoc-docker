JEKYLL_VERSION = 4.2.0
PANDOC_VERSION = 2.11.3.2

build : Dockerfile
	docker build --pull \
		--build-arg jekyll_version=$(JEKYLL_VERSION) \
		--build-arg pandoc_version=$(PANDOC_VERSION) \
		-t palazzo/jekyll-pandoc:$(JEKYLL_VERSION)-$(PANDOC_VERSION) \
		.

tufte : pandoc-sidenote/Dockerfile
	docker build --pull \
		--build-arg jekyll_version=$(JEKYLL_VERSION) \
		--build-arg pandoc_version=$(PANDOC_VERSION) \
		-t palazzo/jekyll-tufte:$(JEKYLL_VERSION) \
		pandoc-sidenote/.
