require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)     
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id)
    end

    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '保存できない場合' do
      it 'post_codeが空だと保存できないこと' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.post_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buyer_address.prefecture_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁未満の半角でないと保存できないこと' do
        @buyer_address.phone_number = '090-1234-5678'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end

