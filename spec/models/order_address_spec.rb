require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入者住所の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されてtokenがあれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'municipalitiesが空だと保存できないこと' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'call_numberが空だと保存できないこと' do
        @order_address.call_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Call number can't be blank")
      end
      it 'call_numberが全角数字だと保存できないこと' do
        @order_address.call_number = '００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Call number 10桁以上11桁以内で半角数値を使用して入力してください')
      end
      it 'call_numberが9桁以下だと保存できないこと' do
        @order_address.call_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Call number 10桁以上11桁以内で半角数値を使用して入力してください')
      end
      it 'call_numberが12桁以上だと保存できないこと' do
        @order_address.call_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Call number 10桁以上11桁以内で半角数値を使用して入力してください')
      end
      it 'prefecture_idが---では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
