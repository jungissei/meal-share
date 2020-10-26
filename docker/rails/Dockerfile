FROM ruby:2.6.3


SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash

RUN apt-get update && apt-get install --no-install-recommends -y python \
  -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  vim \
  default-mysql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j4

COPY . /app


EXPOSE 3000

RUN yarn install --check-files && \
  yarn upgrade && \
  bundle exec rake assets:precompile
