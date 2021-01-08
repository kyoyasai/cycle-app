require 'rails_helper'

describe Article do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事新規投稿' do
    context '新規投稿がうまくいく時' do
      it '必要事項が全て存在すれば登録できる' do
        expect(@article).to be_valid
      end
    end
    context '新規投稿がうまくいかない時' do
      it 'titleが空だと登録できない' do
        @article.title = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end
      it '県名を選択しないと登録できない' do
        @article.prefecture_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include ("Prefecture Select")
      end
      it 'distanceが空だと登録できない' do
        @article.distance = ""
        @article.valid?
        expect(@article.errors.full_messages).to include ("Distance can't be blank")
      end
      it 'contentが空だと登録できない' do
        @article.content = ""
        @article.valid?
        expect(@article.errors.full_messages).to include ("Content can't be blank")
      end
    end
  end
end