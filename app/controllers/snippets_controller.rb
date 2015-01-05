class SnippetsController < ApplicationController
  before_action :find_snippet, except: [:index, :new, :create]

  def index
    @snippets = Snippet.all
  end

  def create
    @snippet = Snippet.new(snippet_params)
    if @snippet.save
      redirect_to snippets_path, notice: 'snippet created'
    else
      render :new, alert: 'snippet failure'
    end
  end

  def update
    if @snippet.update(snippet_params)
      redirect_to snippet_path(@snippet.id), notice: 'snippet edited'
    else
      render :edit, alert: 'snippet editing failure'
    end
  end

  def destroy
    @snippet.destroy
    redirect_to snippets_path, notice: 'snippet deleted'
  end

  private
  def snippet_params

  end
end
