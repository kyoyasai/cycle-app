require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.create(:article)
    @comment = FactoryBot.create(:comment)
  end

  context 'コメント投稿ができるとき' do
    it 'コメント投稿に成功し、投稿したコメントが投稿詳細ページに表示される' do
      # ログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 記事詳細ページに移動する
      visit article_path(@article)
      # コメントフォームが存在する
      expect(page).to have_selector '.comment-text'
      # フォームにコメントを入力する
      fill_in 'comment[message]', with: @comment.message
      # 送信するとCommentモデルのカウントが1上がる
      expect {
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      # 記事詳細ページに戻ってくることを確認する
      expect(current_path).to eq article_path(@article)
      # 記事詳細ページに先ほどのコメントが表示されていることを確認する
      expect(page).to have_content(@comment.message)
    end
  end

  context 'コメント投稿ができないとき' do
    it 'ログインしていなければコメント投稿できない' do
      # 記事詳細ページに移動する
      visit article_path(@article)
      # コメント投稿フォームが無い
      expect(page).to have_no_selector '.comment-text'
    end
  end
end
