FROM nginx:1.16

RUN apt-get update && apt-get install --no-install-recommends -y python \
  -y apt-utils \
  locales\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen \
  && locale-gen ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8
# 初期状態の設定ファイル
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
