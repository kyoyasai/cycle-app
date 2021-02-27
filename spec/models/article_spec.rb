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
      it 'タイトルが空だと登録できない' do
        @article.title = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'タイトルが16文字以上だと登録できない' do
        @article.title = Faker::Lorem.characters(number: 16)
        @article.valid?
        expect(@article.errors.full_messages).to include("タイトルは15文字以内で入力してください")
      end
      it '都道府県を選択しないと登録できない' do
        @article.prefecture_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include ("都道府県を選択してください")
      end
      it '距離が空だと登録できない' do
        @article.distance = ""
        @article.valid?
        expect(@article.errors.full_messages).to include ("距離を入力してください")
      end
      it 'できごとが空だと登録できない' do
        @article.content = ""
        @article.valid?
        expect(@article.errors.full_messages).to include ("できごとを入力してください")
      end
      it 'できごとが151文字以上だと登録できない' do
        @article.content = Faker::Lorem.characters(number: 151)
        @article.valid?
        expect(@article.errors.full_messages).to include("できごとは150文字以内で入力してください")
      end
      it '画像タイトルが16文字以上だと登録できない' do
        @article.image_title = Faker::Lorem.characters(number: 16)
        @article.valid?
        expect(@article.errors.full_messages).to include("画像タイトルは15文字以内で入力してください")
      end
    end
  end
end