FROM alpine:3.2
MAINTAINER renanmpimentel <renanmpimentel@gmail.com>

# Additional repositories
RUN repositories='\
  http://dl-4.alpinelinux.org/alpine/v3.2/main/\
  @edge http://nl.alpinelinux.org/alpine/edge/main/\
  @testing http://nl.alpinelinux.org/alpine/edge/testing/' \
  && echo $repositories | sed -e 's/\/\s/\/\n/g' > /etc/apk/repositories

# install default packages
RUN packages=' \
    bash \
    vim \
    git \
    tar \
    curl \
    wget \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/* \
