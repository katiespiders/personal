class PineapplesController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_pineapple, except: [:index, :new, :create]

  def index
    @pineapples = Pineapple.all
  end

  def create
    @pineapple = Pineapple.new(pineapple_params)
    if @pineapple.save
      redirect_to pineapples_path, notice: 'pineapple created'
    else
      render :new, alert: 'pineapple failure'
    end
  end

  def update
    if @pineapple.update(pineapple_params)
      redirect_to pineapple_path(@pineapple.id), notice: 'pineapple edited'
    else
      render :edit, alert: 'pineapple editing failure'
    end
  end

  def destroy
    @pineapple.destroy
    redirect_to pineapples_path, notice: 'pineapple deleted'
  end

  private
    def pineapple_params
      
    end
  end
