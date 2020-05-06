class KilometerDrivensController < ApplicationController
  before_action :set_kilometer_driven, only: [ :edit, :update, :destroy]
  access except: [ :edit, :create, :update, :new, :destroy, :index], user: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[ :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  def index
    @kilometerdrivens = KilometerDriven.all
  end

  def new
    @kilometerdriven = KilometerDriven.new
  end

  def edit
  end

  def create
    @kilometerdriven = KilometerDriven.new(kilometer_driven_params)

      if @kilometerdriven.save
        format.html { redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
      if @kilometerdriven.update(kilometer_driven_params)
        format.html { redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @kilometerdriven.destroy
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
