class ConceptsController < ApplicationController
  before_action except: [:index, :show] { authorize(resources_path) }
  before_action :find_concept, except: [:index, :new, :create]

  def index
    @concepts = Concept.all
  end

  def create
    @concept = Concept.new(concept_params)
    if @concept.save
      redirect_to concepts_path, notice: "#{@concept.title} created"
    else
      render :new, notice: 'concept failure'
    end
  end

  def update
    if @concept.update
      redirect_to concepts_path, notice: "#{@concept.title} edited"
    else
      render :edit, notice: notice: 'you broke it'
    end
  end

  def destroy
    @concept.destroy
    redirect_to concepts_path
  end

  private

    def find_concept
      Concept.find(params[:id])
    end

    def concept_params
      params.require(:concept).permit(:name)
    end
  end
