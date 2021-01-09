require 'rails_helper'

RSpec.describe "記事投稿機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.build(:article)
  end

  context '記事投稿ができるとき' do
    it '記事投稿に成功し、トップページに遷移する' do
      # ログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # トップページに新規投稿ボタンがあることを確認する
      expect(page).to have_content("新規投稿")
      # 新規投稿ページに移動する
      visit new_article_path
      # フォームに必要な投稿内容を全て記入する
      fill_in 'article[title]', with: @article.title
      select '北海道', from: 'article[prefecture_id]'
      fill_in 'article[distance]', with: @article.distance
      fill_in 'article[content]', with: @article.content
      # 送信するとArticleモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Article.count }.by(1)
      # トップページに遷移したことを確認する
      expect(current_path).to eq root_path
      # トップページに投稿した記事が存在することを確認する
      expect(page).to have_content(@article.content)
    end
  end

  context '記事投稿できない時' do
    it 'ログインしていなければ記事投稿できない' do
      # トップページに移動する
      visit root_path
      # 新規投稿ページへのリンクが無い
      expect(page).to have_no_content("新規投稿")
    end  
  end
end

RSpec.describe "記事編集機能", type: :system do
  before do
    @article1 = FactoryBot.create(:article)
    @article2 = FactoryBot.create(:article)
  end

  context '記事編集ができるとき' do
    it '記事1を投稿したユーザーでログインし、記事1の編集ができる' do
      # 記事1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @article1.user.email
      fill_in 'user[password]', with: @article1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事1への編集ボタンがあることを確認する
      expect(
        find('.bar-btn').click
      ).to have_link '編集', href: edit_article_path(@article1)
      # 編集ページに移動する
      visit edit_article_path(@article1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('.short-text').value
      ).to eq @article1.title
      expect(
        find('.select-box').value
      ).to eq "#{@article1.prefecture_id}"
      expect(
        find('.distance-text').value
      ).to eq "#{@article1.distance}"
      expect(
        find('.long-text').value
      ).to eq @article1.content
      # 投稿内容を編集する
      fill_in 'article[content]', with: "#{@article1.content} + 編集テキスト" 
      # 編集してもArticleモデルのカウントが変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Article.count }.by(0)
      # トップページに遷移したことを確認する
      expect(current_path).to eq root_path
      # トップページに編集した記事が存在することを確認する
      expect(page).to have_content("#{@article1.content} + 編集テキスト")
    end
  end

  context '記事投稿できない時' do
    it 'ログインしていなければ記事投稿できない' do
      # トップページに移動する
      visit root_path
      # 記事1に編集ボタンが無い
      expect(page).to have_no_selector('.bar-btn')
    end
    it '記事2を投稿したユーザーでログインし、記事1の編集ができない' do
      # 記事2を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @article2.user.email
      fill_in 'user[password]', with: @article2.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事1への編集ボタンが無いことを確認する
      expect(
        find('.bar-btn').click
      ).to have_no_link '編集', href: edit_article_path(@article1)
    end
  end
end

RSpec.describe "記事削除機能", type: :system do
  before do
    @article1 = FactoryBot.create(:article)
    @article2 = FactoryBot.create(:article)
  end

  context '記事削除ができるとき' do
    it '記事1を投稿したユーザーでログインし、記事1の削除ができる' do
      # 記事1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @article1.user.email
      fill_in 'user[password]', with: @article1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事1への削除ボタンがあることを確認する
      expect(
        find('.bar-btn').click
      ).to have_link '削除', href: article_path(@article1)
      # 記事1を削除するとレコードが1減ることを確認する
      expect{
        find_link('削除', href: article_path(@article1)).click
      }.to change { Article.count }.by(-1)
      # トップページに遷移したことを確認する
      expect(current_path).to eq root_path
      # トップページに削除した記事が存在しないことを確認する
      expect(page).to have_no_content(@article1.content)
    end
  end

  context '記事削除できない時' do
    it 'ログインしていなければ記事削除できない' do
      # トップページに移動する
      visit root_path
      # 記事1に削除ボタンが無い
      expect(page).to have_no_selector('.bar-btn')
    end
    it '記事2を投稿したユーザーでログインし、記事1の削除ができない' do
      # 記事2を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @article2.user.email
      fill_in 'user[password]', with: @article2.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事1への削除ボタンが無いことを確認する
      expect(
        find('.bar-btn').click
      ).to have_no_link '削除', href: article_path(@article1)
    end
  end
end