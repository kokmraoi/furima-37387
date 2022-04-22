## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null :false, unique :true |
| encrypted_password | string | null :false               |
| nickname           | string | null :false               |
| lastname           | string | null :false               |
| firstname          | string | null :false               |
| lastname_kata      | string | null :false               |
| firstname_kata     | string | null :false               |
| birthday           | string | null :false               |

### Association

- has_many :items
- has_one :order

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null :false                    |
| item_description | text       | null :false                    |
| item_category    | string     | null :false                    |
| item_status      | string     | null :false                    |
| delivery_charge  | string     | null :false                    |
| shipment_source  | string     | null :false                    |
| date_of_shipment | string     | null :false                    |
| item_price       | string     | null :false                    |
| item_image       | text       | null :false                    |
| user_id          | references | null :false, foreign_key :true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null :false, foreign_key :true |
| item_id    | references | null :false, foreign_key :true |

### Association

- belongs_to :user
- has_one :shipping

## shippings テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null :false                    |
| prefectures      | string     | null :false                    |
| municipalities   | string     | null :false                    |
| address          | string     | null :false                    |
| building_name    | string     |                                |
| telephone_number | string     | null :false                    |
| user_id          | references | null :false, foreign_key :true |
| item_id          | references | null :false, foreign_key :true |

### Association
- belongs_to :order