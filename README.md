# テーブル設計

## users

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association

- has_many :articles
- has_many :comments



## articles

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| title         | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| distance      | float      | null: false                    |
| content       | text       | null: false                    |
| evaluation    | float      |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :tweet-tags


## comments

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| article | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article



## tags

| Column   | Type   | Options     |
|----------|--------|-------------|
| tag_name | string | null: false |


### Association

- has_many :article-tags



## article-tags

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| article | references | null: false, foreign_key: true |
| tag     | references | null: false, foreign_key: true |

### Association

- belongs_to :article
- belongs_to :tag
