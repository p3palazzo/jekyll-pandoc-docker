ARG pandoc_version=3.1.1
ARG jekyll_version=4.2.2

FROM pandoc/core:${pandoc_version} AS pandoc-base

RUN apk update \
	&& apk --no-cache add \
	cabal \
	ghc-dev \
	libffi-dev \
	musl-dev \
	wget

RUN cabal update && cabal install \
	pandoc-sidenote

FROM jekyll/jekyll:${jekyll_version}

COPY --from=pandoc-base \
	/usr/local/bin/pandoc \
	/usr/local/bin/pandoc-crossref \
	/root/.cabal/bin/pandoc-sidenote \
	/usr/local/bin/

RUN apk --no-cache add \
	gmp \
	libffi \
	lua5.4 \
	lua5.4-lpeg
