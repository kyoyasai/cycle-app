## アプリケーション名
#### CYCLE NOTE

## 開発環境
HTML&CSS / JavaScript / Bootstrap / Ruby / Ruby on Rails / RSpec /<br>
MySQL / EC2 / S3 / Visual Studio Code

## URL
http://18.177.112.110/

## ログイン方法
ヘッダー右側のゲストログインボタンから、ゲストユーザーでログイン可能
<img src="./images/ゲストログイン.png" width="900px" title="ゲストログイン">

## アプリケーション概要
サイクリングの体験を共有できるアプリ<br>
アプリの主要機能は以下の通り<br>
#### 1. 記事の投稿
ヘッダーの新規投稿ボタンから記事投稿画面に移動<br>
タイトル、都道府県、走行距離、できごと、画像タイトル(任意)、画像(任意)を入力することで、記事の投稿が出来る<br>
<img src="./images/記事投稿画面1.png" height="400px" title="記事の投稿">  <img src="./images/記事投稿画面2.png" height="400px" title="記事の投稿">
#### 2. 記事の表示
投稿した記事は、トップページに表示される<br>
<img src="./images/投稿一覧画面.png" width="900px" title="投稿一覧">
#### 3. いいね機能
投稿された記事に対して、いいねを押すことが出来る<br>
<img src="./images/いいね機能.png" width="900px" title="いいね機能">
[](![いいね機能](./images/いいね機能.png))
#### 4. 記事の検索
投稿された記事を、キーワード・走行距離・都道府県の項目で検索出来る<br>
<img src="./images/投稿検索画面.png" width="900px" title="記事の検索">
[](![記事の検索](./images/投稿検索画面.png))
#### 5. 記事へのコメント
記事のタイトルまたは画像をクリックして、記事詳細ページに移動<br>
記事詳細ページから記事へのコメントができる<br>
<img src="./images/コメント機能1.png" height="400px" title="コメント機能">  <img src="./images/コメント機能2.png" height="400px" title="コメント機能">
#### 6. 記事の編集・削除
自分が投稿した記事には、記事の右上にプルダウンボタンが表示される<br>
プルダウンボタンをクリックして表示されるメニューから、記事の編集・削除を行うことができる<br>
<img src="./images/記事編集・削除メニュー.png" width="900px" title="記事の編集・削除">


## 制作背景
自分の趣味であるサイクリングに関して、インターネット上にサイクルスポットなどの口コミサイトがなかった<br>
一方、友人の体験談から聞いたサイクルスポットに興味を持つことがしばしばあった<br>
以上の経験から、誰でも気軽にサイクリングの体験を共有しあえるサービスはないかと考え、本アプリを考案<br>

#### 目的のターゲット層
サイクリングが趣味の人

#### どんなニーズ&課題に
・他の人のサイクリングの体験を知りたい<br>
・サイクルスポットの情報が知りたい<br>
・おおよそのサイクリング距離が知りたい

## 実装機能一覧
#### ユーザー管理機能（新規登録・ログイン）/ 記事投稿機能 / 記事一覧表示機能 / マイページ記事一覧表示機能 / 
#### ユーザー登録情報編集機能 / 記事詳細表示機能 / 記事編集・削除機能 / 画像投稿機能 / 記事検索機能 / いいね機能 / 
#### 記事並び替え機能 / ゲストログイン機能 / ページネーション機能 / レスポンシブデザイン

## DB設計
<img src="./images/ER.png" width="500px" title="ER図" align="left"><br><br><br><br><br><br>&ensp;&ensp;・usersテーブル：ユーザー情報を管理<br>&ensp;&ensp;・articlesテーブル：投稿記事の情報を管理<br>&ensp;&ensp;・commentsテーブル：コメント情報を管理<br>&ensp;&ensp;・likesテーブル：いいね情報を管理<br clear="all">


## 工夫したポイント
* 記事の表示方法に関して、次の2点を工夫<br>
1点目は、走行距離や都道府県の検索フォームを作成し、サイクリングの用途に応じた投稿検索が行えるよう工夫<br>（アプリケーションの概要4の図を参照）<br>
2点目は、投稿日時順やいいね順での並び替え機能を作成し、自分が見たい投稿が上位に来るよう工夫（下図）<br>
<img src="./images/並び替え_投稿日時順.png" width="900px" title="投稿並び替え">  <img src="./images/並び替え_いいね順.png" width="900px" title="投稿並び替え"> <br><br>
* レスポンシブデザインを実装し、異なるデバイスの画面幅に対応（1枚目：PC画面、2枚目：スマホ画面）<br>
<img src="./images/レスポンシブ_PC画面.png" height="400px" title="PC画面"> <img src="./images/レスポンシブ_スマホ画面.png" height="400px" title="スマホ画面">

## 今後実装したい機能
* Dockerの導入
* キーワードのタグ付け機能<br>
* ユーザーフォロー機能<br>
* SNSアカウントとの連携<br>
* いいねされた時の通知機能<br>

## ローカルでの動作方法
1. ターミナル上で、作業用のディレクトリに移動し、以下のコマンドを実行
```ターミナル
% git clone https://github.com/takuya-karatsu/cycle-app.git
% cd cycle-app
% bundle install
% yarn install 
% rails db:create
% rails db:migrate
```
2. config/environments/development.rbおよびconfig/environments/production.rbの記述を下記のように修正する
```
# 修正前
config.active_storage.service = :amazon
```
```
# 修正後
config.active_storage.service = :local
```
3. 下記コマンドを入力後、http://localhost:3000/ にアクセス
```ターミナル
% rails s
```
