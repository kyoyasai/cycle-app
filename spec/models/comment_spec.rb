require 'rails_helper'

describe Comment do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'message存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'messageが空だと登録できない' do
        @comment.message = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Messageを入力してください")
      end
    end
  end
end