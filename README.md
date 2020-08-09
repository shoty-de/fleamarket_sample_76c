# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# fleamarket DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|

### Association
- belongs_to :profiles

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|
|birthmonth|integer|null: false|
|birthyear|integer|null: false|

### Association
- belongs_to :profiles
- has_many :creditcards
- has_many :products
- has_many :addresses

## creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|profile_id|references|foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

### Association
- belongs_to :profiles

## productsテーブル
|title|string|null: false|
|text|text|null: false|
|category_id|references|foreign_key: true|
|sub_category_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|condition|string|null: false|
|shipping_charge|integer|foreign_key: true|
|prefecture_id|references|foreign_key: true|
|deliver_leadtime|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :profiles
- belongs_to :prefectures
- belongs_to :categories
- belongs_to :sub_categories
- belongs_to :sizes
- has_many :brands
- has_many :product_images

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|profile_id|references|foreign_key: true|
|post_family_name|string|null: false|
|post_family_name_kana|string|null: false|
|post_personal_name|string|null: false|
|post_personal_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture_id|references|foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string|
|phone_number|integer|

### Association
- belongs_to :profiles
- belongs_to :prefectures

## prefecturesテーブル
|name|string|null: false|

### Association
- belongs_to :products

## categoriesテーブル
|name|string|null: false|

### Association
- has_many :products

## sub_categoriesテーブル
|name|string|null: false|
|category_id|references|foreign_key: true|

### Association
- has_many :products

## sizesテーブル
|name|string|null: false|

### Association
- has_many :products

## brandsテーブル
|name|string|null: false|

### Association
- belongs_to :products

## product_imagesテーブル
|image|string|null: false|
|product_id|references|foreign_key: true|

### Association
- belongs_to :products
