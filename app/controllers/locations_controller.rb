class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[  :destroy]}, message: "Only Admin can perform this"

  def index
    @locations = Location.all.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
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

  def update
    if @location.update(location_params)
      redirect_to locations_path, notice: 'Branch was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: 'Location was successfully destroyed.'
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude,:user_id)
    end
end
