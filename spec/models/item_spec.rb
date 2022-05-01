require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '出品内容の保存' do
    context '出品できる場合' do
      it '必須項目が存在すれば登録できる' do
      @item.image = fixture_file_upload('app/assets/images/flag.png')
      expect(@item).to be_valid
      end
     end 
 
     context '出品できない場合' do
      it "nameがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "descriptionがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it "status_idがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "priceがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "category_idがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "shipping_cost_idがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it "shipping_dayがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it "prefectureがない場合は登録できないこと" do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
    end
  end
end
