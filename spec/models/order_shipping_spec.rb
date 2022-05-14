require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '入力内容の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it '全ての入力内容が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_code(郵便番号)が空では保存できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code(郵便番号)は3桁ハイフン4桁の半角文字列でないと保存できないこと' do
        @order_shipping.postal_code = '12345678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_id(都道府県)が空(id:1)では保存できないこと' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalities(市区町村)が空では保存できないこと' do
        @order_shipping.municipalities = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'address(番地)が空では保存できないこと' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_number(電話番号)が空では保存できないこと' do
        @order_shipping.telephone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_number(半角数値)は9桁以下では購入できない' do
        @order_shipping.telephone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_number(半角数値)は12桁以上では購入できない' do
        @order_shipping.telephone_number = '123456789123'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_nmuberに半角数字以外が含まれている場合は購入できない' do
        @order_shipping.telephone_number = '09-12345678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空では保存できないこと' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ購入できない' do
        @order_shipping.user_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @order_shipping.item_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
