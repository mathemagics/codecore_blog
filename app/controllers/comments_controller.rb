class CommentsController < ApplicationController

  before_action :authenticate_user, only: [:create, :destroy]

  def create
    @post               = Post.find params[:post_id]
    @comment_params     = params.require(:comment).permit(:body)
    @comment            = Comment.new @comment_params
    @comment.post       = @post
    @comment.user       = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end


  end

  def destroy
    @comment=params[:id]
    @post=@comment.post
    @comment.destroy
    redirect_to post_path(@post)
  end

end
