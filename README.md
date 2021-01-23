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
- has_many :likes



## articles

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| title         | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| distance      | float      | null: false                    |
| content       | text       | null: false                    |
| image_title   | string     |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :likes


## comments

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| article | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article



## likes

| Column  | Type   | Options     |
|---------|--------|-------------|
| user    | string | null: false |
| article | string | null: false |


### Association

- belongs_to :user
- belongs_to :article
