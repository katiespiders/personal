class BlurbsController < ApplicationController
  before_action except: [:index, :show] { authorize(blurbs_path) }
  before_action :find_blurb, except: [:index, :new, :create]

  def index
    @blurbs = Blurb.all
  end

  def create
    @blurb = Blurb.new(blurb_attributes)
    if @blurb.save
      redirect_to blurbs_path, notice: 'blurb created'
    else
      render :new, alert: 'blurb failure'
    end
  end

  def update
    if @blurb.update(blurb_attributes)
      redirect_to blurb_path(@blurb.id), notice: 'blurb edited'
    else
      render :edit, alert: 'you broke it'
    end
  end

  def destroy
    @blurb.destroy
    redirect_to blurbs_path, notice: 'blurb deleted'
  end

  private
    def find_blurb
      @blurb = Post.find(params[:id])
    end

    def blurb_params
      params.require(:blurb).permit(:body, :resources, :concepts)
    end

    def blurb_resources
      resources = params[:blurb][:resources].reject { |r| r.empty? }
      resources.collect { |r| Resource.find_by(id: r) }
    end

    def blurb_concepts
      concepts = params[:blurb][:concepts].reject { |c| c.empty? }
      concepts.collect { |c| Concept.find_by(id: c) }
    end

    def blurb_attributes
      {
        body: blurb_params[:body],
        resources: blurb_resources,
        concepts: blurb_concepts
      }
    end
end
