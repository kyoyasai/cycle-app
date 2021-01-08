require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '必要事項が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録でいない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが7文字以下だと登録できない' do
        @user.password = "abcd123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'passwordに英字を含めないと登録できない' do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'passwordに数字を含めないと登録できない' do
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationがpasswordに一致しなければ登録できない' do
        @user.password_confirmation = "abcd1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角でないと登録できない' do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角で記入してください")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角でないと登録できない' do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で記入してください")
      end
    end
  end
end