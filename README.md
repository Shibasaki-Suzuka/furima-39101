# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| nickname            | string              | null: false, unique: true |
| email               | string              | null: false, unique: true |
| password            | string              | null: false               |
| encrypted_password  | string              | null: false               |
| family_name         | string              | null: false               |
| first_name          | string              | null: false               |
| family_name_kana    | string              | null: false               |
| first_name_kana     | string              | null: false               |
| birthday            | string              | null: false               |

### Association

* has_many :items
* has_many :shipping_addresses

## items table

| Column            | Type            | Options                       |
|-------------------|-----------------|-------------------------------|
| item_name         | string          | null: false                   |
| text              | text            | null: false                   |
| category          | string          | null: false                   |
| states            | string          | null: false                   |
| postage_burden    | string          | null: false                   |
| shipping_area     | string          | null: false                   |
| shipping_days     | string          | null: false                   |
| selling_price     | integer         | null: false                   |
| seller            | string          | null: false                   |
| user              | string          | null: false, foreign_key: true|

### Association

* belongs_to :user
* has_one :shipping_address

## shipping_addresses table

| Column             | Type            | Options                       |
|--------------------|-----------------|-------------------------------|
| buyer              | string          | null: false                   |
| buy_item           | string          | null: false                   |
| user               | string          | null: false, foreign_key: true|

### Association

* belongs_to :item
* has_one :address

## addresses table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| post_code          | string              | null: false               |
| prefectures        | string              | null: false               |
| municipalities     | string              | null: false               |
| address            | string              | null: false               |
| building_name      | string              | null: false               |
| telephone_number   | string              | null: false, unique: true |

### Association

* belongs_to :shipping_address


