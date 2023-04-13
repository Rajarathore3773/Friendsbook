class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ show edit update destroy ]

  
  def index
    @posts =Post.all
  end

  
  def show
  end

  def new
    @post = Post.new
  end

  
   def create
  
    # @post = @user.posts.build(post_params)
     #@post = current_user.posts.build(post_params)
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def edit
  end

  def update

   if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, status: :see_other
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content,:user_id,:image)
    end
end
