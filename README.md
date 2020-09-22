# Meal Share

Meal Shareとは、食べ物をシェアするウェブサイトです。 [https://cook.issei-dev.work/](https://cook.issei-dev.work/)

***DebugAccount:***

[email] [issei-dev@gmail.com](mailto:issei-dev@gmail.com)[password] bmm4NVMRUAaY



## 使用した技術

- AWS
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
    - bootstrap
    - font-awesome-sass


## AWS 構成図

[https://user-images.githubusercontent.com/42998753/93853666-3b454480-fcef-11ea-8488-c22e5e5637df.jpg](https://user-images.githubusercontent.com/42998753/93853666-3b454480-fcef-11ea-8488-c22e5e5637df.jpg)


## 概要

美味しいものをネット上に記録しておきたいという方は多いと思います。
Meal Shareとは、作った料理や、レストランの食べ物をシェアし交流するウェブサイトです。 


## 機能

- 記事を投稿する(写真を添付)
- コメントの送信
- 記事にいいねを付ける
- ユーザーをフォローする
- 通知機能

## Requirement
ruby 2.6.3
rails 6.0.2