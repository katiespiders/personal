class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Posted #{@post.title}"
    else
      render :new
    end
  end

  private

    def authorize
      redirect_to posts_path, notice: 'Authorization fail' unless me?
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
