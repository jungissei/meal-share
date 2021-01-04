# Meal Share

Meal Shareとは、美味しいものえお食べ物をシェアするウェブサイトです。 [https://cook.issei-dev.work/](https://cook.issei-dev.work/)

***DebugAccount:***

[https://cook.issei-dev.work/users/sign_in](https://cook.issei-dev.work/users/sign_in)で「ゲストログイン(閲覧用)」ボタンリンクを押下でログイン


## 使用技術

- Ruby 2.6.3
- Ruby on Rails 6.0.3
- MySQL 5.7
- AWS
  - VPC
  - ECS
  - ECR
  - Route53
  - S3
  - RDS
  - ALB
- デプロイ
  - CircleCI
- 画像アップロード
  - carrierwave
  - fog
  - mini_magick
- 通知機能
- ユーザー認証
  - Devise
- 検索機能
  - ransack
- DB
  - mysql
- ページネーション
  - kaminari
- デザイン
  - Bootstrap4

## AWS 構成図

![chart](https://user-images.githubusercontent.com/42998753/103541236-80783580-4ede-11eb-9952-22523167d337.png)

## 概要

美味しいものをネット上に記録しておきたいという方は多いと思います。
Meal Shareとは、作った料理や、レストランの食べ物をシェアし交流するウェブサイトです。 

## 機能

- ユーザー登録、ログイン機能(devise)
- 投稿機能
  - 画像投稿
- コメント(ajax)
- 記事にいいねを付ける(ajax)
- フォロー機能(ajax)
- 通知機能
- 検索機能
