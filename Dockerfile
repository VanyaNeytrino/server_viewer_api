FROM ruby:2.7.1
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      yarn
RUN mkdir /server_viewer_api
WORKDIR /server_viewer_api
COPY Gemfile /server_viewer_api/Gemfile
COPY Gemfile.lock /server_viewer_api/Gemfile.lock
RUN bundle install
COPY . /server_viewer_api

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]