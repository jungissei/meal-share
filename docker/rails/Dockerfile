FROM ruby:2.6.3

# Install yarn
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install nodejs & default-mysql-client, vim
RUN apt-get update && apt-get install -y --no-install-recommends\
  nodejs \
  default-mysql-client \
  vim \
  yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN yarn add jquery bootstrap popper.js @fortawesome/fontawesome-free

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .
COPY . /app

EXPOSE 3000

RUN bundle install
RUN bundle exec rake assets:precompile
