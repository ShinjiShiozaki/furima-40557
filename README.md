
## users テーブル(ユーザ情報)
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| sei_kanji          | string | null: false               |
| mei_kanji          | string | null: false               |
| sei_kana           | string | null: false               |
| mei_kana           | string | null: false               |
| tanjyoubi          | date   | null: false               |
### Association
- has_many :items
- has_many :kounyuus

## items テーブル(商品情報)
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| mei                  | string     | null: false                    |
| setsumei             | text       | null: false                    |
| category_id          | integer    | null: false                    |
| jyoutai_id           | integer    | null: false                    |
| haisouryou_futan_id  | integer    | null: false                    |
| hassoumoto_chiiki_id | integer    | null: false                    |
| hassou_nissuu_id     | integer    | null: false                    |
| kakaku               | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :kounyuu


## kounyuus テーブル(購入記録)
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :hassousaki

## hassousakis テーブル(発送先情報)
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| yuubin_bangou     | string     | null: false                    |
| todoufuken_id     | integer    | null: false                    |
| shikuchouson      | string     | null: false                    |
| banchi            | string     | null: false                    |
| tatemono          | string     | null: true                     |
| denwabango        | string     | null: true                     |
| kounyuu           | references | null: false, foreign_key: true |
### Association
- belongs_to :kounyuu

