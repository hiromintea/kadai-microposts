class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav(micropost)
    flash[:success] = 'この投稿をお気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfav(micropost)
    flash[:success] = 'この投稿をお気に入りから解除しました。'
    redirect_to root_url
  end
end