JEKYLL_VERSION = 4.2.0
PANDOC_VERSION = 2.12

push : build tufte
	docker push palazzo/jekyll-pandoc:$(JEKYLL_VERSION)-$(PANDOC_VERSION)
	docker push palazzo/jekyll-tufte:$(JEKYLL_VERSION)-$(PANDOC_VERSION)

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
		-t palazzo/jekyll-tufte:$(JEKYLL_VERSION)-$(PANDOC_VERSION) \
		pandoc-sidenote/.
