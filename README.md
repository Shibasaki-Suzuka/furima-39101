# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| nickname            | string              | null: false               |
| email               | string              | null: false, unique: true |
| encrypted_password  | string              | null: false               |
| last_name           | string              | null: false               |
| first_name          | string              | null: false               |
| last_name_kana      | string              | null: false               |
| first_name_kana     | string              | null: false               |
| birthday            | date                | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column            | Type            | Options                       |
|-------------------|-----------------|-------------------------------|
| item_name         | string          | null: false                   |
| sentence          | text            | null: false                   |
| category_id       | integer         | null: false                   |
| status_id         | integer         | null: false                   |
| postage_burden_id | integer         | null: false                   |
| prefecture_id     | integer         | null: false                   |
| shipping_day_id   | integer         | null: false                   |
| selling_price     | integer         | null: false                   |
| user              | references      | null: false, foreign_key: true|

### Association

* belongs_to :user
* has_one :order

## orders table

| Column             | Type            | Options                       |
|--------------------|-----------------|-------------------------------|
| user               | references      | null: false, foreign_key: true|
| item               | references      | null: false, foreign_key: true|

### Association

* belongs_to :user
* belongs_to :item
* has_one :address

## addresses table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| post_code          | string              | null: false                    |
| prefecture_id      | integer             | null: false                    |
| municipalities     | string              | null: false                    |
| address            | string              | null: false                    |
| building           | string              |                                |
| call_number        | string              | null: false                    |
| order              | references          | null: false, foreign_key: true |

### Association

* belongs_to :order


