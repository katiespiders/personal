class PostsController < ApplicationController
  before_action except: [:index, :show] { authorize(posts_path) }
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_attributes)
    if @post.save
      redirect_to posts_path, notice: "posted #{@post.title}"
    else
      render :new, notice: 'post creation failure'
    end
  end

  def update
    if @post.update(post_attributes)
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

    def post_attributes
      {
        title: post_params[:title],
        body: post_params[:body],
        resources: [Resource.find_by(id: post_params[:resources])],
        concepts: [Concept.find_by(id: post_params[:concepts])]
      }
    end
end
