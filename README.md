# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :items
- has_one :buyer
- has_many :addresses, through: :buyer
- has_many :Purchase histories


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| price              | integer    | null: false                    |
| category           | string     |                                |
| overview           | text       |                                |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buyer


## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |
| date               | date       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items
- has_many :addresses


## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| post_code          | strings    | null: false                    |
| prefectures        | strings    | null: false                    |
| address            | strings    | null: false                    |
| tel                | strings    | null: false                    |

### Association

- belongs_to :buyers
- belongs_to :user, through: :buyers



## Purchase histories テーブル （購入履歴）

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| buyer              | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buyers
