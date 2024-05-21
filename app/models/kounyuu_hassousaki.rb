class KounyuuHassousaki

  include ActiveModel::Model
  attr_accessor :yuubin_bangou, :todoufuken_id, :todoufuken_id, :shikuchouson, :banchi, :tatemono, :denwabango, :kounyuu_id, :item_id, :user_id, :token
  #belongs_to :user
  #belongs_to :item


  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :yuubin_bangou, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :todoufuken_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :shikuchouson
    validates :banchi
    #validates :denwabango
    validates :denwabango, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Sólo se pueden guardar números de medio ancho entre 10 y 11 dígitos"}
    validates :user_id
    validates :item_id
    #validates :kounyuu_id
  end

  # 各テーブルにデータを保存する処理を書く
  def save
    # 購入記録情報を保存し、変数kounyuuに代入する
    kounyuu = Kounyuu.create(item_id: item_id, user_id: user_id)
    # 配送先情報を保存する
    # kounyuu_idには、変数kounyuuのidと指定する
    Hassousaki.create(yuubin_bangou: yuubin_bangou, todoufuken_id: todoufuken_id, shikuchouson: shikuchouson, banchi: banchi, tatemono: tatemono, denwabango: denwabango,kounyuu_id: kounyuu.id)
  end
end