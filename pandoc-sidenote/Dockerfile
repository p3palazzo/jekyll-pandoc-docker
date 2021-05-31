ARG pandoc_version=2.14
ARG jekyll_version=4.2.0

FROM pandoc/alpine-crossref:${pandoc_version} AS pandoc-base

FROM alpine:3.12 AS pandoc-sidenote

RUN apk update \
	&& apk --no-cache add \
	cabal \
	ghc-dev \
	musl-dev \
	wget

RUN cabal update && cabal install \
	pandoc-sidenote

FROM palazzo/jekyll:${jekyll_version}

RUN gem install jekyll-pandoc -- --use-system-libraries

COPY --from=pandoc-base \
	/usr/local/bin/pandoc \
	/usr/local/bin/pandoc-citeproc \
	/usr/local/bin/pandoc-crossref \
	/usr/local/bin/

COPY --from=pandoc-sidenote \
  /root/.cabal/bin/pandoc-sidenote \
  /usr/local/bin/

RUN apk --no-cache add \
	gmp \
	libffi \
	lua5.3 \
	lua5.3-lpeg
