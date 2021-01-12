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
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it 'emailが重複していると登録でいない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
      it 'passwordが7文字以下だと登録できない' do
        @user.password = "abcd123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'passwordに英字を含めないと登録できない' do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'passwordに数字を含めないと登録できない' do
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'password_confirmationがpasswordに一致しなければ登録できない' do
        @user.password_confirmation = "abcd1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
    end
  end
end