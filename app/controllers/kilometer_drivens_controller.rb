class KilometerDrivensController < ApplicationController
  before_action :set_kilometer_driven, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}
  # GET /kilometerdrivens
  # GET /kilometerdrivens.json
  def index
    @kilometerdrivens = KilometerDriven.all
  end

  # GET /kilometerdrivens/1
  # GET /kilometerdrivens/1.json
  def show
  end

  # GET /kilometerdrivens/new
  def new
    @kilometerdriven = KilometerDriven.new
  end

  # GET /kilometerdrivens/1/edit
  def edit
  end

  # POST /kilometerdrivens
  # POST /kilometerdrivens.json
  def create
    @kilometerdriven = KilometerDriven.new(kilometer_driven_params)

    respond_to do |format|
      if @kilometerdriven.save
        format.html { redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully created.' }
        format.json { render :show, status: :created, location: @kilometerdriven }
      else
        format.html { render :new }
        format.json { render json: @kilometerdriven.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kilometerdrivens/1
  # PATCH/PUT /kilometerdrivens/1.json
  def update
    respond_to do |format|
      if @kilometerdriven.update(kilometer_driven_params)
        format.html { redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully updated.' }
        format.json { render :show, status: :ok, location: @kilometerdriven }
      else
        format.html { render :edit }
        format.json { render json: @kilometerdriven.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kilometerdrivens/1
  # DELETE /kilometerdrivens/1.json
  def destroy
    @kilometerdriven.destroy
    respond_to do |format|
      format.html { redirect_to kilometer_drivens_url, notice: 'Kilometerdriven was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kilometer_driven
      @kilometerdriven = KilometerDriven.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kilometer_driven_params
      params.require(:kilometer_driven).permit(:name)
    end
end
