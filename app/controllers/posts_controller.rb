class PostsController < ApplicationController
  before_action except: [:index, :show] { authorize(posts_path) }
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "posted #{@post.title}"
    else
      render :new, notice: 'post creation failure'
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
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :resources, :concepts)
    end
end
