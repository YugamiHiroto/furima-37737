require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @buyer_address = FactoryBot.build(:buyer_address)
    end

    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'building_nameは空でも保存できること' do
      end
    end

    context '保存できない場合' do
      it 'post_codeが空だと保存できないこと' do
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'addressが空だと保存できないこと' do
      end
      it 'phone_numberが空だと保存できないこと' do
      end
      it 'phone_numberが10桁以上11桁未満の半角でないと保存できないこと' do
      end
    end
  end
end

