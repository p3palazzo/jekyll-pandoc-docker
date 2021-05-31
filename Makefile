JEKYLL_VERSION = 4.2.0
PANDOC_VERSION = 2.14

push : palazzo/jekyll-pandoc palazzo/jekyll-tufte
	docker push palazzo/jekyll-pandoc:$(JEKYLL_VERSION)-$(PANDOC_VERSION)
	docker push palazzo/jekyll-tufte:$(JEKYLL_VERSION)-$(PANDOC_VERSION)

palazzo/jekyll-pandoc : Dockerfile
	docker build --pull \
		--build-arg jekyll_version=$(JEKYLL_VERSION) \
		--build-arg pandoc_version=$(PANDOC_VERSION) \
		-t $@ \
		.
	docker tag $@ \
		$@:$(JEKYLL_VERSION)-$(PANDOC_VERSION)

palazzo/jekyll-tufte : pandoc-sidenote/Dockerfile
	docker build --pull \
		--build-arg jekyll_version=$(JEKYLL_VERSION) \
		--build-arg pandoc_version=$(PANDOC_VERSION) \
		-t $@ \
		./pandoc-sidenote/
	docker tag $@ \
		$@:$(JEKYLL_VERSION)-$(PANDOC_VERSION)

# vim: set shiftwidth=2 tabstop=2 :
