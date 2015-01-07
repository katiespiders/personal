class BlurbsController < ApplicationController
  before_action :find_blurb, except: [:index, :new, :create]

  def index
    @blurbs = Blurb.all
  end

  def create
    @blurb = Blurb.new(blurb_params)
    if @blurb.save
      redirect_to blurbs_path, notice: 'blurb created'
    else
      render :new, alert: 'blurb failure'
    end
  end

  def update
    if @blurb.update(blurb_params)
      redirect_to blurb_path(@blurb.id), notice: 'blurb edited'
    else
      render :edit, alert: 'blurb editing failure'
    end
  end

  def destroy
    @blurb.destroy
    redirect_to blurbs_path, notice: 'blurb deleted'
  end

  private
  def blurb_params

  end
end
