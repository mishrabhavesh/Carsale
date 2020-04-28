class RegistrationYearsController < ApplicationController
  before_action :set_registration_year, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  def index
    @registrationyears = RegistrationYear.all
  end

  def show
  end

  def new
    @registrationyear = RegistrationYear.new
  end

  def edit
  end

  def create
    @registrationyear = RegistrationYear.new(registration_year_params)

    respond_to do |format|
      if @registrationyear.save
        format.html { redirect_to registration_years_path, notice: 'Registrationyear was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @registrationyear.update(registration_year_params)
        format.html { redirect_to registration_years_path, notice: 'Registrationyear was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @registrationyear.destroy
    respond_to do |format|
      format.html { redirect_to registration_years_url, notice: 'Registrationyear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_registration_year
      @registrationyear = RegistrationYear.find(params[:id])
    end

    def registration_year_params
      params.require(:registration_year).permit(:name)
    end
end
