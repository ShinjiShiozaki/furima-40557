require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '商品登録ができる時' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が必須であること' do
        @item.mei = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Mei can't be blank"
      end
      it '商品の説明が必須であること' do
        @item.setsumei = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Setsumei can't be blank"
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品の状態の情報が必須であること' do
        @item.jyoutai_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Jyoutai must be other than 1"
      end
      it '配送料の負担の情報が必須であること' do
        @item.haisouryou_futan_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Haisouryou futan must be other than 1"
      end
      it '発送元の地域の情報が必須であること' do
        @item.todoufuken_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Todoufuken must be other than 1"
      end
      it '発送までの日数の情報が必須であること' do
        @item.hassou_nissuu_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Hassou nissuu must be other than 1"
      end
      it '価格の情報が必須であること' do
        @item.kakaku = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Kakaku can't be blank"
      end
      it '価格は、￥300~￥9,999,999の間のみ保存可能であること' do
        @item.kakaku = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Kakaku must be greater than or equal to 300"
        @item.kakaku = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Kakaku must be less than or equal to 9999999"
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.kakaku = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Kakaku is not a number"
      end
    end
  end
end
