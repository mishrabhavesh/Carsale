class CarCostsController < ApplicationController
  before_action :set_car_cost, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  def index
    @carcosts = CarCost.all
  end

  def show
  end

  def new
    @carcost = CarCost.new
  end

  def edit
  end

  def create
    @carcost = CarCost.new(car_cost_params)

    if @carcost.save
      redirect_to car_costs_path, notice: 'Carcost was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carcost.update(car_cost_params)
      redirect_to car_costs_path, notice: 'Carcost was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carcost.destroy
    redirect_to car_costs_path, notice: 'Carcost was successfully destroyed.'
  end

  private
    def set_car_cost
      @carcost = CarCost.find(params[:id])
    end

    def car_cost_params
      params.require(:car_cost).permit(:condition, :price)
    end
end
