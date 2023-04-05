# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| nickname            | string              | null: false               |
| email               | string              | null: false, unique: true |
| encrypted_password  | string              | null: false               |
| family_name         | string              | null: false               |
| first_name          | string              | null: false               |
| family_name_kana    | string              | null: false               |
| first_name_kana     | string              | null: false               |
| birthday            | date                | null: false               |

### Association

* has_many :items
* has_many :shipping_addresses

## items table

| Column            | Type            | Options                       |
|-------------------|-----------------|-------------------------------|
| item_name         | string          | null: false                   |
| sentence          | text            | null: false                   |
| category.id       | integer         | null: false                   |
| states.id         | integer         | null: false                   |
| postage_burden.id | integer         | null: false                   |
| prefectures.id    | integer         | null: false                   |
| shipping_days.id  | integer         | null: false                   |
| selling_price     | integer         | null: false                   |
| user              | references      | null: false, foreign_key: true|

### Association

* belongs_to :user
* has_one :shipping_address

## orders table

| Column             | Type            | Options                       |
|--------------------|-----------------|-------------------------------|
| buyer              | string          | null: false                   |
| buy_item           | string          | null: false                   |
| user               | references      | null: false, foreign_key: true|
| item               | references      | null: false, foreign_key: true|

### Association

* belongs_to :item
* has_one :address

## addresses table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| post_code          | string              | null: false                    |
| prefectures        | integer             | null: false                    |
| municipalities     | string              | null: false                    |
| address            | string              | null: false                    |
| building           | string              |                                |
| call_number        | string              | null: false                    |
| order              | references          | null: false, foreign_key: true |

### Association

* belongs_to :order


