class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  before_action :user_judge, only: [:edit, :update, :destroy]

  def index
    @articles = Article.includes(:user)
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

  def edit
  end

  def update
    if @article.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  private
  def item_params
    params.require(:article).permit(:title, :prefecture_id, :distance, :content, :evalustion).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def user_judge
    redirect_to root_path unless current_user == @article.user
  end
end
