require 'rails_helper'

RSpec.describe KounyuuHassousaki, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @kounyuu_hassousaki = FactoryBot.build(:kounyuu_hassousaki, item_id: item.id, user_id: user.id)
  end

  describe '商品の購入' do
    context '商品の購入ができる時' do
      #binding.pry
      it '必要なカラムが存在すれば登録できる' do
        expect(@kounyuu_hassousaki).to be_valid
      end
    end

    context '商品の購入ができない時' do
    #  it 'ニックネームが必須であること' do
    #    @user.nick_name = '' # nick_nameの値を空にする
    #    @user.valid?
    #    expect(@user.errors.full_messages).to include "Nick name can't be blank"
    #  end
    end


    #【要件】配送先の住所情報も購入の都度入力させること
    #【要件】郵便番号が必須であること
    #【要件】郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）
    #【要件】都道府県が必須であること
    #【要件】市区町村が必須であること
    #【要件】番地が必須であること
    #【要件】建物名は任意であること
    #【要件】電話番号が必須であること
    #【要件】電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）

  end

  
end
