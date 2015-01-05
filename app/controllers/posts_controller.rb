class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "posted #{@post.title}"
    else
      render :new, notice: 'fail'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "edited #{@post.title}"
    else
      render :edit, notice: 'you broke it'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

    def authorize
      redirect_to posts_path, notice: 'authorization fail' unless me?
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
