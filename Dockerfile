ARG pandoc_version=2.11.4
ARG jekyll_version=4.2.0

FROM pandoc/alpine-crossref:${pandoc_version} AS pandoc-base

FROM palazzo/jekyll:${jekyll_version} AS jekyll

RUN gem install jekyll-pandoc -- --use-system-libraries

COPY --from=pandoc-base \
	/usr/local/bin/pandoc \
	/usr/local/bin/pandoc-citeproc \
	/usr/local/bin/pandoc-crossref \
	/usr/local/bin/

RUN apk --no-cache add \
	gmp \
	libffi \
	lua5.3 \
	lua5.3-lpeg

