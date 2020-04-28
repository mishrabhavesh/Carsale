class KilometerDrivensController < ApplicationController
  before_action :set_kilometer_driven, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  def index
    @kilometerdrivens = KilometerDriven.all
  end

  def show
  end

  def new
    @kilometerdriven = KilometerDriven.new
  end

  def edit
  end

  def create
    @kilometerdriven = KilometerDriven.new(kilometer_driven_params)

    respond_to do |format|
      if @kilometerdriven.save
        format.html { redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @kilometerdriven.update(kilometer_driven_params)
        format.html { redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @kilometerdriven.destroy
    respond_to do |format|
      format.html { redirect_to kilometer_drivens_url, notice: 'Kilometerdriven was successfully destroyed.' }
    end
  end

  private
    def set_kilometer_driven
      @kilometerdriven = KilometerDriven.find(params[:id])
    end

    def kilometer_driven_params
      params.require(:kilometer_driven).permit(:name)
    end
end
