class ResourcesController < ApplicationController
  before_action except: [:index, :show] { authorize(resources_path) }
  before_action :find_resource, except: [:index, :new, :create]

  def index
    @resources = Resource.all
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to resources_path, notice: "#{@resource.title} created"
    else
      render :new, notice: 'resource creation failure'
    end
  end

  def update
    if @resource.update
      redirect_to resources_path, notice: "#{@resource.title} edited"
    else
      render :edit, notice: 'you broke it'
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_path
  end

  private

    def find_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :author, :url, :concepts)
    end
end
