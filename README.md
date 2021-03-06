# Nagano-cake

 ≪ながのCAKE≫の商品を通販するためのECサイト。

## 概要

　顧客側の機能
 
 
  - アカウント作成なしでながのCAKEの商品の閲覧が可能。
  - 通販を利用する場合は、お客様にアカウント作成をして頂き、商品をカートに入れ注文が可能。
  - 商品の配送先は自宅以外にも登録ができ、プレゼントとして配送することも可能。
  - 注文から届くまでの状況を注文ステータスとして確認が可能。

　管理者側の機能
 
 
  - 商品、ジャンル、顧客情報の編集が可能。
  - お客様からの注文の管理、配送までの管理が可能。


## 機能

- deviceを使用したログイン機能
- paranoiaを使用した論理削除の実装
- gemを使用せず顧客側、管理者側の双方実装

　他の機能はこちらを参照して下さい。
（https://s3-ap-northeast-1.amazonaws.com/wals/uploads/1147/functions_list.pdf）

## 必要要件

　こちらを参照してください。
（https://s3-ap-northeast-1.amazonaws.com/wals/uploads/1147/functions_list.pdf）

## 使い方

　管理者、顧客側それぞれログインはメールアドレスを【chibaragi@yahoo.co.jp】、パスワードは【aaaaaa】で使用できます。
　顧客側の場合、新規作成で好きなアカウントを作成しても利用が可能です。

## バージョン
　Rails 5.2.4.3
　ruby 2.5.7

## インストール
```
$ git clone git@github.com:chibaragi/nagano-cake.git
$ cd nagano-cake
$ rails db:migrate
$ rails db:seed
$ bundle install
```
 
## 作者

　飯田恭子
　西橋充樹
　佐々木貫二郎
　伊藤堅亮
