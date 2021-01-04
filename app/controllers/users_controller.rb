class UsersController < ApplicationController
  before_action :search_product, only: :show

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def search
    @user = User.find(params[:id])
    @articles = @user.articles
    @results = @q.result.includes(:user)
  end

  def search_product
    @q = Article.ransack(params[:q])
  end
end
