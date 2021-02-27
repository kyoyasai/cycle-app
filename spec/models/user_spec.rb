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
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'ニックネームが11文字以上だと登録できない' do
        @user.nickname = Faker::Lorem.characters(number: 11)
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームは10文字以内で入力してください")
      end
      it 'Eメールが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'Eメールが重複していると登録でいない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが7文字以下だと登録できない' do
        @user.password = "abcd123"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'パスワードに英字を含めないと登録できない' do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'パスワードに数字を含めないと登録できない' do
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて8文字以上で設定して下さい")
      end
      it 'パスワード（確認用）が空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワード（確認用）がパスワードに一致しなければ登録できない' do
        @user.password_confirmation = "abcd1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end