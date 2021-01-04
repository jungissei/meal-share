# 概要

Meal Shareとは、美味しいものえお食べ物をシェアするウェブサイトです。 [https://cook.issei-dev.work/](https://cook.issei-dev.work/)

***DebugAccount:***

[https://cook.issei-dev.work/users/sign_in](https://cook.issei-dev.work/users/sign_in)で「ゲストログイン(閲覧用)」ボタンリンクを押下でログイン


## 使用技術

- Ruby 2.6.3
- Ruby on Rails 6.0.3
- MySQL 5.7
- AWS(VPC, ECS, ECR, Route53, S3, RDS, ALB)
- デプロイ(CircleCIのaws-ecr, aws-ecs, aws-cliのorbsを使用し、ECRにイメージプッシュ、ECSクラスターのタスク定義を更新、必要に応じてcliでしてデプロイ)
- 画像アップロード(carrierwave, fog, mini_magick)
- 通知機能
- ユーザー認証(Devise)
- 検索機能(ransack)
- DB(AWS:RDS)
- ページネーション(kaminari)
- デザイン(Bootstrap4)

## AWS 構成図

![chart](https://user-images.githubusercontent.com/42998753/103541236-80783580-4ede-11eb-9952-22523167d337.png)

## 概要

美味しいものをネット上に記録しておきたいという方は多いと思います。
Meal Shareとは、作った料理や、レストランの食べ物をシェアし交流するウェブサイトです。 

## 機能

- ユーザー登録、ログイン機能(devise)
- 画像投稿機能
  - 料理画像を投稿できる
- コメント(ajax)
  - 投稿にコメントができる。
- 記事にいいねを付ける(ajax)
  - 投稿にいいねをすることができる。
- フォロー機能(ajax)
  - ユーザー同士でフォローしあうことができる。フォローすると、HOME画面にフォローしているユーザーの投稿が表示される。
- 通知機能
  - コメントされた時、いいねされた時、フォローされた時に通知がされる。
- 検索機能
  - 投稿のタイトルと、本文のor検索ができる。
- レスポンシブデザイン


# About me

WordPressやEC-CUBEを中心にサイト制作を5年しております。ウェブ開発における開発者の常識的なスキルを身に着けたいと思い勉強中です。

[https://qiita.com/jungissei](Qiita)
[https://twitter.com/jungissei](Twitter)
