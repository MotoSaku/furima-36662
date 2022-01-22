require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context '登録できる時' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '登録ができない時' do
      it "item_nameが空だと登録できない" do
        @item.item_name = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "overviewが空では登録できない" do
        @item.overview = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Overview can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is can't be blank")
      end
      it 'category_idが1(---)だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is can't be blank")
      end
      it 'status_idが空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is can't be blank")
      end
      it 'status_idが1(---)だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is can't be blank")
      end
      it 'charge_idが空だと登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge is can't be blank")
      end
      it 'charge_idが1(---)だと登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge is can't be blank")
      end
      it 'city_idが空だと登録できない' do
        @item.city_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("City is can't be blank")
      end
      it 'city_idが1(---)だと登録できない' do
        @item.city_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("City is can't be blank")
      end
      it 'delivery_idが空だと登録できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery is can't be blank")
      end
      it 'delivery_idが1(---)だと登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery is can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満では保存できないこと' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is 300~9999999, only integer and Half size number")
      end
      it 'priceが9,999,999円を超過すると保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is 300~9999999, only integer and Half size number")
      end
      it "priceが全角数字では登録できない" do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is 300~9999999, only integer and Half size number")
      end
      it 'imageを選択していないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
