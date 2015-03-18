class RiversController < ApplicationController

  before_action :ensure_current_user

  def index
    @rivers = River.all
  end

  def show
    @river = River.find(params[:id])
    @fishes = Fish.all
  end

  def new
    @river = River.new
  end

  def create
    @river = River.new(river_params)
    if @river.save
      flash[:message] = "It is time to go fishing!!!!!"
      redirect_to rivers_path
    else
      render :new
    end
  end

  def edit
    @river = River.find(params[:id])
  end

  def update
    @river = River.find(params[:id])
    if @river.update(river_params)
      flash[:message] = "Thanks for fixing that, it is time to go fishing!!!!!"
      redirect_to rivers_path
    else
      render :edit
    end
  end

  def destroy
    river = River.find(params[:id])
    river.destroy
    flash[:message] = "YOU RUINED IT!"
    redirect_to rivers_path
  end

  private

  def river_params
    params.require(:river).permit(:name, :city, :state)
  end

  def ensure_current_user
    unless current_user
      redirect_to root_path
      flash[:message] = "You need to sign in first before you can see the fishing hot spots!"
    end
  end


end
