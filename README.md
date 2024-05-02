
## users テーブル(ユーザ情報)
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| sei_kanji          | string | null: false |
| mei_kanji          | string | null: false |
| sei_kana           | string | null: false |
| mei_kana           | string | null: false |
| tanjyou_nen        | int    | null: false |
| tanjyou_tsuki      | int    | null: false |
| tanjyou_nichi      | int    | null: false |
### Association
- has_many :items
- has_many :kounyuus

## items テーブル(商品情報)
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| gazou             | string     | null: false |
| mei               | string     | null: false |
| setsumei          | text       | null: false |
| category          | string     | null: false |
| jyoutai           | string     | null: false |
| haisouryou_futan  | string     | null: false |
| hassoumoto_chiiki | string     | null: false |
| hassou_nissuu     | string     | null: false |
| kakaku            | int        | null: false |
| user_id           | references | null: false, foreign_key: true |
### Association
- belongs_to :users
- has_one :kounyuus


## kounyuus テーブル(購入記録)
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| soldout           | boolean    | null: false |
| item_id           | references | null: false, foreign_key: true |
| user_id           | references | null: false, foreign_key: true |
### Association
- belongs_to :users
- belongs_to :items
- has_one :hassousakis

## hassousakis テーブル(発送先情報)
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| yuubin_bangou     | int        | null: false |
| todoufuken        | string     | null: false |
| shikuchouson      | string     | null: false |
| banchi            | string     | null: false |
| tatemono          | string     | null: true  |
| denwabango        | int        | null: true  |
| kounyuu_id        | references | null: false, foreign_key: true |
### Association
- belongs_to :kounyuus

