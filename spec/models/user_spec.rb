require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,birth_date,family_name,faist_name,family_name_kana,first_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合'
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'birth_dateが空だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
    it 'family_nameが空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'family_name_kanaが空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end
    it 'family_nameが半角だと登録できない' do
      @user.family_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name is invalid. Input full-width characters.'
    end
    it 'first_nameが半角だと登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
    end
    it 'family_name_kanaがカタカナ以外だと登録できない' do
      @user.family_name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana is invalid. Input full-width katakana characters.'
    end
    it 'first_name_kanaがカタカナ以外だと登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters.'
    end
  end
end
