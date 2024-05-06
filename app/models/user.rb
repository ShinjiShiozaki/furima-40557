class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #ニックネームが必須であること
  validates :nick_name, presence: true

  #メールアドレスが必須であること
  #メールアドレスが一意性であること
  #メールアドレスは、@を含む必要があること
  #validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  #パスワードが必須であること
  #パスワードは、6文字以上での入力が必須であること
  #パスワードは、半角英数字混合での入力が必須であること
  #パスワードとパスワード（確認）は、値の一致が必須であること
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  #validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password, confirmation: true

  #新規登録/本人情報確認
  #お名前(全角)は、名字と名前がそれぞれ必須であること
  #お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
  #お名前カナ(全角)は、名字と名前がそれぞれ必須であること
  #お名前カナ(全角)は、全角（カタカナ）での入力が必須であること
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :sei_kanji, :mei_kanji, :sei_kana, :mei_kana, presence: true, format: { with: VALID_NAME_REGEX }

  #生年月日が必須であること
  validates :tanjyoubi, presence: true

end
