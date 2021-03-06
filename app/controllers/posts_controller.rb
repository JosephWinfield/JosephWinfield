class PostsController < ApplicationController
  before_action :authorize_user, except: [
    :index,
    :show
  ]

  def index
    @posts = Post.order("id DESC").all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, alert: 'Blog Post successfully deleted'
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Blog Post successfully added"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Operator Error!!"
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :description, :body)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
    end
  end

end
