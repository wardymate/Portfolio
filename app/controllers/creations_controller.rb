class CreationsController < ApplicationController

  def index
    @creations = Creation.all
  end

  def new
    @creation = Creation.new
  end

  def create
    @creation = Creation.create(creation_params)
    redirect_to '/creations'
  end

  def creation_params
    params.require(:creation).permit(:name, :image)
  end

  def show
    @creation = Creation.find(params[:id])
  end

  def edit
    @creation = Creation.find(params[:id])
  end

  def update
    @creation = Creation.find(params[:id])
    @creation.update(creation_params)
    redirect_to '/creations'
  end

  def destroy
    @creation = Creation.find(params[:id])
    @creation.destroy
    flash[:notice] = 'Creation deleted successfully'
    redirect_to '/creations'
  end
end
