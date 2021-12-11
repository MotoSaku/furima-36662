# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
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

- belongs_to :user
- has_one :history



## histories テーブル （購入履歴）

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| address            | references | null: false,                   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :history



## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | strings    | null: false                    |
| city_id            | integer    | null: false                    |
| municipalities     | strings    | null: false                    |
| address            | strings    | null: false                    |
| building           | strings    |                                |
| tel                | strings    | null: false                    |

### Association

- belongs_to :item
- belongs_to :history