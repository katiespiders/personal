class PostsController < ApplicationController
  before_action except: [:index, :show] { authorize(posts_path) }
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :draft_access, only: [:show, :edit]

  def index
    @posts = Post.all
  end

  def draft_index
    @posts = Post.where(published?: false)
    render :index
  end

  def published_index
    @posts = Post.where(published?: true)
    render :index
  end

  def create
    puts "!"*80, "trying to create something"
    @post = Post.new(post_attributes)
    puts "@"*80, "got attributes"
    if @post.save
      @post.update(published_at: @post.updated_at) if @post.published?
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
      params.require(:post).permit(:title, :body, :resources, :concepts, :commit)
    end

    def post_resources
      if params[:post][:resources]
        puts "*"*80, "looking for resources"
        resources = params[:post][:resources].reject { |r| r.empty? }
        resources.collect { |r| Resource.find_by(id: r) }
      else
        puts "*"*80, "no resources"
      end
    end

    def post_concepts
      if params[:post][:concepts]
        puts "&"*80, "looking for tags from #{params[:post][:concepts]}"
        concepts = params[:post][:concepts].reject { |c| c.empty? }
        puts "#"*80, "fixed stupid tags array, now #{concepts}"
        blah = concepts.collect { |c| Concept.find_by(id: c) }
        puts "$"*80, "found tags #{blah}"
        blah
      else
        puts "&"*80, "no tags"
      end
    end

    def published?
      params[:submit] == 'publish'
    end

    def post_attributes
      {
        title: post_params[:title],
        body: post_params[:body],
        resources: post_resources,
        concepts: post_concepts,
        published?: published?
      }
    end

    def draft_access
      unless @post.published? || me?
        redirect_to posts_path, alert: 'what are you doing in here'
      end
    end
end
