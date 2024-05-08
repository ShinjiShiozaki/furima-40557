require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    context 'ユーザ登録ができる時' do
      it '必要なカラムが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      it 'ニックネームが必須であること' do
        @user.nick_name = '' # nick_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it 'メールアドレスが必須であること' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが全角の場合は登録できない' do
        @user.password = '123456あ'
        @user.password_confirmation = '123456あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
        @user.sei_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kanji can't be blank")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
        @user.mei_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kanji can't be blank")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.sei_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sei kanji is invalid')
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.mei_kanji = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei kanji is invalid')
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.sei_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kanji can't be blank")
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.mei_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kanji can't be blank")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.sei_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sei kana is invalid')
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.mei_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei kana is invalid')
      end
      it '生年月日が必須であること' do
        @user.tanjyoubi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Tanjyoubi can't be blank")
      end
    end
  end
end
