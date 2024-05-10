class Item < ApplicationRecord
  has_one_attached :image

  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category_list
  belongs_to :jyoutai_list
  belongs_to :haisouryou_futan_list
  belongs_to :todoufuken_list
  belongs_to :hassou_nissuu_list

  # 空の投稿を保存できないようにする
  validates :mei, :setsumei, :category_id, :jyoutai_id, :haisouryou_futan_id, :todoufuken_id, :hassou_nissuu_id, :kakaku, :image,
            presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :jyoutai_id, numericality: { other_than: 1 }
  validates :haisouryou_futan_id, numericality: { other_than: 1 }
  validates :todoufuken_id, numericality: { other_than: 1 }
  validates :hassou_nissuu_id, numericality: { other_than: 1 }

  # 価格は半角数値で、300~9,999,999の間のみ保存可能であること
  validates :kakaku, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
