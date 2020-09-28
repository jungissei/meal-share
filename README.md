# Meal Share

Meal Shareとは、食べ物をシェアするウェブサイトです。 [https://cook.issei-dev.work/](https://cook.issei-dev.work/)

***DebugAccount:***

[email] [issei-dev@gmail.com](mailto:issei-dev@gmail.com)<br />
[password] bmm4/VM*UAaY

## 使用技術

- Ruby 2.6.3
- Ruby on Rails 6.0.2
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
- 通知機能
- ユーザー認証
  - Devise
- DB
  - mysql
- ページネーション
  - kaminari
- デザイン
  - Bootstrap4

## AWS 構成図

![download](https://user-images.githubusercontent.com/42998753/93855276-359d2e00-fcf2-11ea-87e5-22a037bb4dbf.png)

## 概要

美味しいものをネット上に記録しておきたいという方は多いと思います。
Meal Shareとは、作った料理や、レストランの食べ物をシェアし交流するウェブサイトです。 

## 機能

- ユーザー登録、ログイン機能(devise)
- 投稿機能
  - 画像投稿
- コメントの送信
- 記事にいいねを付ける
- フォロー機能
- 通知機能