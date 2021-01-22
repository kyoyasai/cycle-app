class UsersController < ApplicationController
  before_action :set_user
  before_action :set_articles
  before_action :search_product

  def show
    if params[:key] == "1"
      @articles = Kaminari.paginate_array(@user.articles.like_sort_result).page(params[:page]).per(10)
    else
      @articles = @user.articles.includes(:user).page(params[:page]).per(10).order("created_at desc")
    end
  end

  def search
    @results = @q.result.includes(:user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_articles
    @articles = @user.articles.includes(:user).page(params[:page]).per(10).order("created_at desc")
  end

  def search_product
    @q = @articles.ransack(params[:q])
  end
end
