class FishesController < ApplicationController

  before_action do
    @river = River.find(params[:river_id])
  end

  def show
    @fish = @river.fishes.find(params[:id])
  end

  def new
    @fish = @river.fishes.new
  end

  def create
    @fish = @river.fishes.new(fish_params)
    @fish.save
    flash[:message] = "That\'s a nice fish!"
    redirect_to river_path(@river)
  end

  def edit
    @fish = @river.fishes.find(params[:id])
  end

  def update
    @fish = @river.fishes.find(params[:id])
    @fish.update(fish_params)
    flash[:message] = "It\'s a good thing you updated that fish!"
    redirect_to river_path(@river)
  end

  def destroy
    fish = @river.fishes.find(params[:id])
    fish.destroy
    flash[:message] = "You should always practice catch and release!"
    redirect_to river_path(@river)
  end



  private

  def fish_params
    params.require(:fish).permit(:species, :length)
  end


end
