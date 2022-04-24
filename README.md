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
| birthday           | date   | null :false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null :false                    |
| item_description    | text       | null :false                    |
| item_category_id    | integer    | null :false                    |
| item_status_id      | integer    | null :false                    |
| delivery_charge_id  | integer    | null :false                    |
| prefecture_id       | integer    | null :false                    |
| date_of_shipment_id | integer    | null :false                    |
| item_price          | integer    | null :false                    |
| user                | references | null :false, foreign_key :true |

### Association

- belongs_to :user
- has_one :order
- belongs_to :item_category
- belongs_to :item_status
- belongs_to :delivery_charge
- belongs_to :prefectures
- belongs_to :date_of_shipment

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null :false, foreign_key :true |
| item   | references | null :false, foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null :false                    |
| prefecture_id    | integer    | null :false                    |
| municipalities   | string     | null :false                    |
| address          | string     | null :false                    |
| building_name    | string     |                                |
| telephone_number | string     | null :false                    |
| order            | references | null :false, foreign_key :true |

### Association
- belongs_to :order