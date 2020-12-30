class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comments = @article.comments.includes(:user)
    if @comment.save
      redirect_to article_path(@article)
    else
      render template: "articles/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, article_id: params[:article_id] )
  end
end
