class RegistrationYearsController < ApplicationController
  before_action :set_registration_year, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}

  # GET /registrationyears
  # GET /registrationyears.json
  def index
    @registrationyears = RegistrationYear.all
  end

  # GET /registrationyears/1
  # GET /registrationyears/1.json
  def show
  end

  # GET /registrationyears/new
  def new
    @registrationyear = RegistrationYear.new
  end

  # GET /registrationyears/1/edit
  def edit
  end

  # POST /registrationyears
  # POST /registrationyears.json
  def create
    @registrationyear = RegistrationYear.new(registration_year_params)

    respond_to do |format|
      if @registrationyear.save
        format.html { redirect_to registration_years_path, notice: 'Registrationyear was successfully created.' }
        format.json { render :show, status: :created, location: @registrationyear }
      else
        format.html { render :new }
        format.json { render json: @registrationyear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrationyears/1
  # PATCH/PUT /registrationyears/1.json
  def update
    respond_to do |format|
      if @registrationyear.update(registration_year_params)
        format.html { redirect_to registration_years_path, notice: 'Registrationyear was successfully updated.' }
        format.json { render :show, status: :ok, location: @registrationyear }
      else
        format.html { render :edit }
        format.json { render json: @registrationyear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrationyears/1
  # DELETE /registrationyears/1.json
  def destroy
    @registrationyear.destroy
    respond_to do |format|
      format.html { redirect_to registration_years_url, notice: 'Registrationyear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_year
      @registrationyear = RegistrationYear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registration_year_params
      params.require(:registration_year).permit(:name)
    end
end
