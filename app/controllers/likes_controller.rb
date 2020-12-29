class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, article_id: params[:article_id])
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    like.destroy
    redirect_to root_path
  end
end
