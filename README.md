# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| name_kana          | string  | null: false               |
| birthday_year_id   | integer | null: false               |
| birthday_month_id  | integer | null: false               |
| birthday_day_id    | integer | null: false               |

### Association

- has_many :items
- has_many :addresses
- has_many :histories
- has_many :comments



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| overview           | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| charge_id          | integer    | null: false                    |
| city_id            | integer    | null: false                    |
| day_id             | integer    | null: false                    |
| price              | integer    | null: false                    |


### Association

- belongs_to :users
- has_one :histories
- has_many :comments



## histories テーブル （購入履歴）

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items



## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| post_code          | strings    | null: false                    |
| city_id            | integer    | null: false                    |
| municipalities     | strings    | null: false                    |
| address            | strings    | null: false                    |
| building           | strings    |                                |
| tel                | strings    | null: false                    |

### Association

- belongs_to :items
- belongs_to :users 



## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| comment            | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :items
