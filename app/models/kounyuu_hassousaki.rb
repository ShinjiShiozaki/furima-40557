class KounyuuHassousaki

  include ActiveModel::Model
  attr_accessor :yuubin_bangou, :todoufuken_id, :todoufuken_id, :shikuchouson, :banchi, :tatemono, :denwabango, :kounyuu_id, :item_id, :user_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    #validates :kounyuu_id
    validates :yuubin_bangou, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :todoufuken_id, numericality: {other_than: 0, message: "can't be blank"}
  
  # 各テーブルにデータを保存する処理を書く
  def save
    # 購入記録情報を保存し、変数kounyuuに代入する
    kounyuu = Kounyuu.create(item_id: item_id, user_id: user_id)
    # 配送先情報を保存する
    # kounyuu_idには、変数kounyuuのidと指定する
    Hassousaki.create(yuubin_bangou: yuubin_bangou, todoufuken_id: todoufuken_id, shikuchouson: shikuchouson, banchi: banchi, tatemono: tatemono, denwabango: denwabango,kounyuu_id: kounyuu.id)
  end
end