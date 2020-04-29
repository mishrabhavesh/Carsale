class LocationsController < ApplicationController
  access except: [  :create, :new, :index], user: {except:[  :create,  :new, :index]}, Admin: :all ,Buyer: {except:[  :create,  :new, :index]}, Seller: :all, message: "Only Admin can perform this"

  def index
    @locations = Location.all.where(user_id: current_user.id)
  end

  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(location_params)
    @location.user_id= current_user.id
    if @location.save
      redirect_to locations_path, notice: 'Branch was successfully created.'
    else
      render :new
    end
  end


  private
    def location_params
      params.require(:location).permit(:address, :latitude, :longitude,:user_id)
    end
end
