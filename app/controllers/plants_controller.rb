class PlantsController < ApplicationController
    # app/controllers/plants_controller.rb
  def index
    plants = Plant.all
    render json: plants
  end

  def show
    plant = Plant.find(params[:id])
    render json: plant
  end

  def create
    plant = Plant.new(plant_params)

    if plant.save
      render json: plant, status: :created
    else
      render json: { error: 'Failed to create plant' }, status: :unprocessable_entity
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end

end

