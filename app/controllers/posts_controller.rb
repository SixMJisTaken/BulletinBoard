class PostsController < ApplicationController
  def index
    @posts = Post.all

  end

  def new
    @user = current_user
    @post = Post.new
  end

  def edit_confirm
    @post = Post.new(post_params)
    if @post.valid?
      puts "success"
      redirect_to confirm_posts_path(post: {title: @post.title , description: @post.description , user_id: @post.user_id })
    else 
      puts "failed"
      render :new, status: :unprocessable_entity
    end
    @test = "blah"
  end

  def confirm
    @post = Post.new(post_params)
    @testing = "success"
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to posts_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to post_path , status: :see_other
  end

  def csv
  end

  private
    def post_params
      params.require(:post).permit(:title , :description , :user_id)
    end
end
