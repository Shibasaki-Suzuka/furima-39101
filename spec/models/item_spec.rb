require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'item_nameとsentence、selling_price、image、category_id、status_id、postage_burden_id、prefecture_id、shipping_day_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'sentenceが空では登録できない' do
        @item.sentence = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sentence can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'postage_burden_idが空では登録できない' do
        @item.postage_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage burden can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'selling_priceが英字では登録できない' do
        @item.selling_price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price は半角数値を使用してください')
      end
      it 'selling_priceが299以下では登録できない' do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price 300~9,999,999を入力してください')
      end
      it 'selling_priceが10000000以上では登録できない' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price 300~9,999,999を入力してください')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      
      
    end
  end

end
