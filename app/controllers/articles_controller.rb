class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(item_params)
    if @article.valid?
      @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:article).permit(:title, :prefecture_id, :distance, :content, :evalustion).merge(user_id: current_user.id)
  end
end
