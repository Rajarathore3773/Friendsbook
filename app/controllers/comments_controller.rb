class CommentsController < ApplicationController

  def index
    @comments=Comment.all
  end

  def edit
  end

  def new
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
    redirect_to post_path(@comments)
    else
      render :new , status: :unprocessable_entity
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter,:user_id,:post_id)
    end
  
end
