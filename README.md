# README

## users テーブル

| Column             | Type   | Options                   |
| -------------------|--------| --------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many   :items,  dependent: :destroy
- has_many   :buyers, dependent: :destroy

## items テーブル

| Column              | Type        | Options                        |
| --------------------|-------------| -------------------------------|
| name                | string      | null: false                    |
| price               | integer     | null: false                    |
| description         | text        | null: false                    |
| status_id           | integer     | null: false                    |
| category_id         | integer     | null: false                    |
| shipping_cost_id    | integer     | null: false                    |
| shippng_day_id      | integer     | null: false                    |
| prefecture_id       | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buyer

## buyers テーブル

| Column             | Type       | Options                        |
| -------------------|------------| -------------------------------|
| user               | references | null: false  foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :deliver_address

## deliver_addresses テーブル

| Column             | Type       | Options                        |
| -------------------|------------| -------------------------------|
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false    |
| buyer              | references | null: false  foreign_key: true |

### Association

- belongs_to :buyer
