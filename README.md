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
| birth_date         | dete   | null: false               |

### Association

- has_many   :items,             dependent: :destroy
- has_many   :buyer,             dependent: :destroy
- has_one    :deliber_adoresses, dependent: :destroy

## items テーブル

| Column             | Type       | Options                        |
| -------------------|------------| -------------------------------|
| name               | string     | null: false                    |
| price              | string     | null: false                    |
| descripton         | string     | null: false                    |
| status             | string     | null: false                    |
| category           | string     | null: false                    |
| shipping_cost      | string     | null: false                    |
| shippng_day        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :buyer
- has_many   :image, dependent: :destroy

## images テーブル

| Column             | Type       | Options                        |
| -------------------|------------| -------------------------------|
| image              | string     | null: false                    |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :itmes

## buyer テーブル

| Column             | Type       | Options                        |
| -------------------|------------| -------------------------------|
| user_id            | references | null: false  foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :itmes

## deliver_adresses テーブル

| Column             | Type       | Options                        |
| -------------------|------------| -------------------------------|
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| adress             | string     | null: false                    |
| building_ name     | string     |                                |
| phone_number       | string     | null: false, unique: true      |
| user_id            | references | null: false  foreign_key: true |

### Association

- belongs_to :users
