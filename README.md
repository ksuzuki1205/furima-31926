
## users テーブル
| Column                     | Type         | Options                        |
| -------------------------- | ------------ | ------------------------------ |
| nickname                   | string       | null:false                     |
| email                      | string       | null:false, unique:true        |
| encrypted_password         | string       | null:false,                    |
| last_name                  | string       | null:false                     |
| first_name                 | string       | null:false                     |
| last_name_kana             | string       | null:false                     |
| first_name_kana            | string       | null:false                     |
| birthday                   | date         | null:false                     |

### Association

- has_many :items
- has_many :purchase_histories



## items テーブル
| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| title               | string       | null:false                     |
| image               |              |                                |
| explanation         | text         | null:false                     |
| category_id         | integer      | null:false                     |
| condition_id        | integer      | null:false                     |
| shipping_charge_id  | integer      | null:false                     |
| ship_from_area_id   | integer      | null:false                     | 
| region_id           | integer      | null:false                     |
| price               | integer      | null:false                     |
| user                | references   | null:false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase_history


## purchases テーブル
| Column            | Type         | Options                        |
| ----------------- | ------------ | ------------------------------ |
| postal_code       | string       | null:false                     |
| region_id         | integer      | null:false                     |
| city              | string       | null:false                     |
| block_number      | string       | null:false                     |
| building_name     | string       |                                |
| phone             | string       | null:false                     |
| purchase_history  | references   | null:false, foreign_key: true  |


## purchase_histories テーブル
| Column               | Type         | Options                        |
| -------------------- | ------------ | ------------------------------ |
| user                 | references   | null:false, foreign_key: true  |
| item                 | references   | null:false, foreign_key: true  |


### Association

- has_one :purchase
- belongs_to :user
- belongs_to :item

<!-- 
型	意味
string	文字列(1〜255文字)
text	長い文字列(1〜4294967296文字)
integer	整数（4バイト）
bigint	整数(8バイト)
float	浮動小数
decimal	精度の高い小数
numeric	数値
datetime	日時
timestamp	タイムスタンプ
time	時間
date	日付
binary	バイナリデータ
boolean	真偽値型 -->
