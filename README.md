## アプリケーション名
CYCLE NOTE

## 開発環境
HTML&CSS / Ruby / Ruby on Rails / JavaScript / Bootstrap /<br>
MySQL / EC2 / S3 / Visual Studio Code

## URL
http://18.177.112.110/

## アプリケーション概要
サイクリングの経験を共有できるアプリ<br>
アプリの主要機能は以下の通り<br>
#### 1. 記事の投稿
ヘッダーの新規投稿ボタンから記事投稿画面に移動<br>
タイトル、都道府県、走行距離、できごと、画像タイトル(任意)、画像(任意)を入力することで、記事の投稿が出来る<br>
<img src="./images/記事投稿画面1.png" height="420px" title="記事の投稿">  <img src="./images/記事投稿画面2.png" height="420px" title="記事の投稿">
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
記事詳細ページから記事へのコメントができる<br>
<img src="./images/コメント機能1.png" height="420px" title="コメント機能">  <img src="./images/コメント機能2.png" height="420px" title="コメント機能">

## 制作背景
自分の趣味であるサイクリングに関して、インターネット上にサイクルスポットなどの口コミサイトがなかった<br>
一方、友人の話を聞いて、自分も同じ場所にサイクリングに行きたいと思う経験がしばしばあった<br>
以上の経験から、誰でも気軽にサイクリングの経験を共有しあえるサービスはないかと考え、本アプリを考案<br>

#### 目的のターゲット層
サイクリングが趣味の人

#### どんなニーズ&課題に
・他の人のサイクリングの経験を知りたい<br>
・サイクルスポットの情報が知りたい<br>
・おおよそのサイクリング距離が知りたい

## ログイン方法
ヘッダー右側のゲストログインボタンから、ゲストユーザーでログイン可能
<img src="./images/ゲストログイン.png" width="900px" title="ゲストログイン">

## 実装機能一覧
#### ユーザー管理機能（新規登録・ログイン）/ 記事投稿機能 / 記事一覧表示機能 / マイページ記事一覧表示機能 / 
#### ユーザー登録情報編集機能 / 記事詳細表示機能 / 記事編集・削除機能 / 画像投稿機能 / 記事検索機能 / いいね機能 / 
#### ゲストログイン機能 / ページネーション機能 / レスポンシブデザイン

## DB設計
### ER図
<img src="./images/ER.png" width="450px" title="ER図">

### テーブル設計
#### users
| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

#### articles
| Column        | Type       | Options           |
|---------------|------------|-------------------|
| title         | string     | null: false       |
| prefecture_id | integer    | null: false       |
| distance      | float      | null: false       |
| content       | text       | null: false       |
| image_title   | string     |                   |
| user_id       | references | foreign_key: true |

#### comments
| Column     | Type       | Options           |
|------------|------------|-------------------|
| message    | text       | null: false       |
| user       | references | foreign_key: true |
| article_id | references | foreign_key: true |

#### likes
| Column     | Type       | Options           |
|------------|------------|-------------------|
| user_id    | references | foreign_key: true |
| article_id | references | foreign_key: true |


## 工夫したポイント
・記事の表示方法に関して、走行距離や都道府県などサイクリングの用途に応じた検索フォームを作成したり（上図参照）、投稿日時順やいいね順での並び替え機能を作成（下図）<br>
<img src="./images/並び替え_投稿日時順.png" width="900px" title="投稿並び替え">  <img src="./images/並び替え_いいね順.png" width="900px" title="投稿並び替え"> <br><br>
・異なるデバイスの画面幅に対応するため、レスポンシブデザインを実装（左図：PC画面、右図：スマホ画面）<br>
<img src="./images/レスポンシブ_PC画面.png" height="340px" title="PC画面"> <img src="./images/レスポンシブ_スマホ画面.png" height="340px" title="スマホ画面">

## 今後実装したい機能
・キーワードのタグ付け機能<br>
・ユーザーフォロー機能<br>
・SNSアカウントとの連携<br>
・いいねされた時の通知機能<br>
