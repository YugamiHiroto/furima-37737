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
      it 'nameがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'status_idがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'priceがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'category_idがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'shipping_cost_idがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it 'shipping_dayがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it 'prefectureがない場合は登録できないこと' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'priceが半角英数字混合では出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.price = '11aa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it 'priceが半角英字のみでは出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it 'priceが商品価格が全角文字では出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it 'カテゴリーに{---}が選択されている場合は出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態に{---}が選択されている場合は出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担に{---}が選択されている場合は出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it '発送元の地域に{---}が選択されている場合は出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数に{---}が選択されている場合は出品できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it 'userが紐付いていないと保存できない' do
        @item.image = fixture_file_upload('app/assets/images/flag.png')
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
