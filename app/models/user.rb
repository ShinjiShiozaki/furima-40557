class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームが必須であること
  validates :nick_name, presence: true

  # パスワードは、半角英数字混合での入力が必須であること
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # 新規登録/本人情報確認
  # お名前(全角)は、名字と名前がそれぞれ必須であること
  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
  VALID_NAME_KANJI_HIRA_KANA = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :sei_kanji, :mei_kanji, presence: true, format: { with: VALID_NAME_KANJI_HIRA_KANA }

  # お名前カナ(全角)は、名字と名前がそれぞれ必須であること
  # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること
  VALID_NAME_KANA = /\A[\p{katakana}ー－]+\z/
  validates :sei_kana, :mei_kana, presence: true, format: { with: VALID_NAME_KANA }

  # 生年月日が必須であること
  validates :tanjyoubi, presence: true

  # アソシエーション
  has_many :items
  # has_many :kounyuus
end
