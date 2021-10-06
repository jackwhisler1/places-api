class PlacesController < ApplicationController
  def index
    places = Place.all()
    render json: places
  end

  def create
    place = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if place.save
      render json: place
    else
      render json: {errors: place.errors.full_messages}, status: unprocessable_entity
    end
  end

  def show
    place = Place.find(params[:id])
    render json: place
  end

  def update
    place = Place.find(params[:id])
    place.name = params[:name] || place.name
    place.address = params[:address] || place.address
    place.image_url = params[:image_url] || place.image_url
    if place.save
      render json: place
    else
      render json: {errors: place.errors.full_messages}, status: unprocessable_entity
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: {Delete: "Successful"}
  end
end
