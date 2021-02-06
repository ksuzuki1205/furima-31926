
## users テーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| NickName         | string       | null:false                     |
| email            | string       | null:false                     |
| password         | string       | null:false                     |
| LastName         | string       | null:false                     |
| FirstName        | string       | null:false                     |
| LastName_kana    | string       | null:false                     |
| FirstName_kana   | string       | null:false                     |
| birthday_year    | integer      | null:false                     |
| birthday_month   | integer      | null:false                     |
| birthday_date    | integer      | null:false                     |

### Association

- has_many :items
- has_many :purchases


## items テーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| title            | string       | null:false                     |
| image            |              |                                |
| explanation      | text         | null:false                     |
| category         | string       | null:false                     |
| condition        | string       | null:false                     |
| shipping_charge  | integer      | null:false                     |
| day_to_ship      | integer      | null:false                     |
| price            | integer      | null:false                     |
| user             | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| CardNumber       | integer      | null:false                     |
| ExpMonth         | integer      | null:false                     |
| ExpYear          | integer      | null:false                     |
| SecurityCode     | integer      | null:false                     |
| PostalCode       | integer      | null:false                     |
| Region           | string       | null:false                     |
| CITY             | string       | null:false                     |
| BlockNumber      | string       | null:false                     |
| BuildingName     | string       | null:false                     |
| Phone            | integer      | null:false                     |


### Association

- belongs_to :user
- belongs_to :item


<!-- カラムの型	説明	用途
integer	数値	金額、回数など
string	文字(短文)	ユーザー名、メールアドレスなど
text	文字(長文)	投稿文、説明文など
boolean	真か偽か	はい・いいえの選択、合格・不合格のフラグなど
datetime	日付と時刻	作成日時、更新日時など -->
