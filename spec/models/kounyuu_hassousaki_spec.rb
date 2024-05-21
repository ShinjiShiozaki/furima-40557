require 'rails_helper'

RSpec.describe KounyuuHassousaki, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @kounyuu_hassousaki = FactoryBot.build(:kounyuu_hassousaki, item_id: item.id, user_id: user.id)
  end

  describe '商品の購入' do

    context '商品の購入ができる時' do
      it '必要なカラムが存在すれば登録できる／【要件】配送先の住所情報も購入の都度入力させること' do
        expect(@kounyuu_hassousaki).to be_valid
      end
      it '【要件】建物名は任意であること' do
        @kounyuu_hassousaki.tatemono = ''
        expect(@kounyuu_hassousaki).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it '【要件】郵便番号が必須であること' do
        @kounyuu_hassousaki.yuubin_bangou = ''
        @kounyuu_hassousaki.valid?
        expect(@kounyuu_hassousaki.errors.full_messages).to include "Yuubin bangou can't be blank"
      end
      it '【要件】郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）' do
        @kounyuu_hassousaki.yuubin_bangou = '1234567'
        @kounyuu_hassousaki.valid?
        expect(@kounyuu_hassousaki.errors.full_messages).to include "Yuubin bangou is invalid. Include hyphen(-)"
      end
      it '【要件】都道府県が必須であること' do
        @kounyuu_hassousaki.todoufuken_id = 1
        @kounyuu_hassousaki.valid?
        expect(@kounyuu_hassousaki.errors.full_messages).to include "Todoufuken can't be blank"
      end
      it '【要件】市区町村が必須であること' do
        @kounyuu_hassousaki.shikuchouson = ''
        @kounyuu_hassousaki.valid?
        expect(@kounyuu_hassousaki.errors.full_messages).to include "Shikuchouson can't be blank"
      end
      it '【要件】番地が必須であること' do
        @kounyuu_hassousaki.banchi = ''
        @kounyuu_hassousaki.valid?
        expect(@kounyuu_hassousaki.errors.full_messages).to include "Banchi can't be blank"
      end
      it '【要件】電話番号が必須であること' do
        @kounyuu_hassousaki.denwabango = ''
        @kounyuu_hassousaki.valid?
        expect(@kounyuu_hassousaki.errors.full_messages).to include "Denwabango can't be blank"
      end
      it '【要件】電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）' do
        @kounyuu_hassousaki.denwabango = '090-1234-5678'
        @kounyuu_hassousaki.valid?
        expect(@kounyuu_hassousaki.errors.full_messages).to include "Denwabango is invalid. Solo se pueden guardar numeros de medio ancho entre 10 y 11 dígitos"
      end
    end
  end
end