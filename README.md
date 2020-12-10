# テーブル設計

## users

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| birth_date         | date    | null: false               |

### Association

- has_many :tweets
- has_many :comments



## tweets

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
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet



## tags

| Column   | Type   | Options     |
|----------|--------|-------------|
| tag_name | string | null: false |


### Association

- has_many :tweet-tags



## tweet-tags

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| tweet  | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :tag