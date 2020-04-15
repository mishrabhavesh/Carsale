class CarCostsController < ApplicationController
  before_action :set_car_cost, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}

  # GET /carcosts
  def index
    @carcosts = CarCost.all
  end

  # GET /carcosts/1
  def show
  end

  # GET /carcosts/new
  def new
    @carcost = CarCost.new
  end

  # GET /carcosts/1/edit
  def edit
  end

  # POST /carcosts
  def create
    @carcost = CarCost.new(car_cost_params)

    if @carcost.save
      redirect_to car_costs_path, notice: 'Carcost was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carcosts/1
  def update
    if @carcost.update(car_cost_params)
      redirect_to car_costs_path, notice: 'Carcost was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carcosts/1
  def destroy
    @carcost.destroy
    redirect_to car_costs_path, notice: 'Carcost was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_cost
      @carcost = CarCost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_cost_params
      params.require(:car_cost).permit(:condition, :price)
    end
end
