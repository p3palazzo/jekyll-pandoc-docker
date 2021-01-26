ARG pandoc_version=2.11.3.2
ARG jekyll_version=4.2.0

FROM palazzo/jekyll-pandoc:${jekyll_version}-${pandoc_version} AS pandoc-base

RUN apk update \
  && apk --no-cache add \
  wget \
  ca-certificates \
  && update-ca-certificates \
	&& wget https://github.com/jez/pandoc-sidenote/releases/download/0.22.1/pandoc-sidenote-0.22.1.zip \
	&& unzip pandoc-sidenote-0.22.1.zip \
	&& cp pandoc-sidenote /usr/local/bin/ \
	&& rm -r pandoc-sidenote pandoc-sidenote-0.22.1.zip
