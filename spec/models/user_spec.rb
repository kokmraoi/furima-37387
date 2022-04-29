require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it '重複したemailが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは6文字以上でないと登録できない' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword(確認)は値が一致しないと登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '123abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'lastnameが空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank", "Lastname is invalid")
    end

    it 'lastnameは全角(漢字・ひらがな・カタカナ)で入力しないと登録できない' do
      @user.lastname = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end

    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'firstnameは全角(漢字・ひらがな・カタカナ)で入力しないと登録できない' do
      @user.firstname = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end

    it 'lastname_kataが空では登録できない' do
      @user.lastname_kata = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kata can't be blank")
    end

    it 'lastname_kataは全角(カタカナ)で入力しないと登録できない' do
      @user.lastname_kata = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kata is invalid")
    end
    
    it 'firstname_kataが空では登録できない' do
      @user.firstname_kata = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kata can't be blank")
    end

    it 'firstname_kataは全角(カタカナ)で入力しないと登録できない' do
      @user.firstname_kata = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kata is invalid")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
