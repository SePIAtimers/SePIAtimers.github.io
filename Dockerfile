FROM ubuntu:focal-20200720

RUN apt-get update && apt-get install -y \
  ruby-full build-essential zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN gem install jekyll bundler
RUN gem update github-pages

WORKDIR /root/app

CMD jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 --disable-disk-cache
