class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = Garden.all
  end

  def show; end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.owner = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @garden.update(garden_params)
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to garden_path
  end

  private

  def garden_params #UPDATE PARAMS
    params.require(:garden).permit(:title, :description, :price_per_hour, :address, :photo)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
