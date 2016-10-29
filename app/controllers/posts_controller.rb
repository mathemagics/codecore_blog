class PostsController < ApplicationController

  before_action :authorize_access, only: [:edit, :update, :destroy]
  before_action :get_post, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user, except: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params(params)

    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end

  end

  def index
    @posts = Post.search(params[:search]).page(params[:page]).per(10)
  end

  def edit
    redirect_to post_path(@post), alert: "Access Denied" unless can? :edit, @post
  end

  def update
    redirect_to posts_path, alert: "access defined" unless can? :update, @post
    if @post.update(post_params(params))
      redirect_to post_path(@post)
      flash[:notice] = "Post updated"
    else
      render :edit
    end
  end

  def show
    @favourite    = @post.like_for(current_user)
    @comment      = Comment.new
  end

  def destroy
    redirect_to root_path, alert: "access defined" unless can? :destroy, @post
    @post.destroy
    redirect_to posts_path, notice: "Post Deleted"
  end

  def post_params(params)
    params.require(:post).permit([:title, :body, :category_id, :user_id])
  end

  def get_post
    @post   = Post.find params[:id]
  end

end
