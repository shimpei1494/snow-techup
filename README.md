# README

## users TABLE

|Column|Type|Options|
|-|-|-|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|prefecture_id|integer|null: false|

### Association
  - has_many :questions
  - has_many :comments

## questions TABLE

|Column|Type|Options|
|-|-|-|
|text|text|null: false|

### Association
  - belongs_to :user
  - has_many :comments

## comments TABLE
|Column|Type|Options|
|-|-|-|
|text|text|-|

### Association
  - belongs_to :user
  - belongs_to :question

