require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it '適切な情報を入力して「出品する」ボタンを押すと商品情報がデータベースに保存されること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category is not a number")
      end
      it '商品の状態の情報が必須であること' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status is not a number")
      end
      it '配送料の負担の情報が必須であること' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it '発送元の地域の情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '発送までの日数の情報が必須であること' do
        @item.date_of_shipment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment is not a number")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be other than 1")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.date_of_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment must be other than 1")
      end
      it '価格の情報が必須であること' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it '価格は¥300より小さいと保存できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include( "Item price must be greater than or equal to 300")
      end
      it '価格は¥300~¥9,999,999より大きいと保存できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.item_price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end 
end
