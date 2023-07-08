JEKYLL_VERSION = 4.2.2
PANDOC_VERSION = 3.1.1

push : palazzo/jekyll-pandoc
	docker push palazzo/jekyll-pandoc:$(JEKYLL_VERSION)-$(PANDOC_VERSION)

palazzo/jekyll-pandoc : Dockerfile
	docker build --pull \
		--build-arg jekyll_version=$(JEKYLL_VERSION) \
		--build-arg pandoc_version=$(PANDOC_VERSION) \
		-t $@ \
		.
	docker tag $@ \
		$@:$(JEKYLL_VERSION)-$(PANDOC_VERSION)

# vim: set shiftwidth=2 tabstop=2 :
