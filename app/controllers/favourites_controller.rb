class FavouritesController < ApplicationController

  before_action :authenticate_user

  def create

    @post       = Post.find(params[:post_id])
    @favourite  = Favourite.new(user: current_user, post: @post)

    if @favourite.save
      redirect_to post_path(@post), notice: "yas"
    else
      redirect_to post_path(@post), notice: "nas"
    end
  end

  def destroy

    @favourite  = Favourite.find(params[:id])
    @post       = @favourite.post

    if @favourite.destroy
      redirect_to post_path(@post), notice: "🗿"
    else
      redirect_to post_path(@post), notice: ""
    end

  end

  def index
    @favourites = User.find(params[:user_id]).favourites.page(params[:page]).per(10)
  end
end
