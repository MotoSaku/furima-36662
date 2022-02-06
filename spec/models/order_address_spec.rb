require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.5
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
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
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'city_idを選択していないと保存できないこと' do
        @order_address.city_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City is can't be blank")
      end
      it 'city_idを2以上で選択していないと保存できないこと' do
        @order_address.city_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City is can't be blank")
      end
      it '市区町村がないと保存できないこと' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'telがないと保存できないこと' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank", "Tel is invalid.")
      end
      it 'telは10桁以上でないと保存できないこと' do
        @order_address.tel = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid.")
      end
      it 'telは11桁以内でないと保存できないこと' do
        @order_address.tel = 1234567890123
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid.")
      end
      it 'telは半角数字でないと保存できないこと' do
        @order_address.tel = 'aaa1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid.")
      end
      it 'telはハイフンがあると保存できないこと' do
        @order_address.tel = '090-1234-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid.")
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
      it 'tokenがないと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
