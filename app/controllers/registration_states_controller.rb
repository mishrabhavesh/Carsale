class RegistrationStatesController < ApplicationController
  before_action :set_registration_state, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  def index
    @registrationstates = RegistrationState.all
  end

  def show
  end

  def new
    @registrationstate = RegistrationState.new
  end

  def edit
  end

  def create
    @registrationstate = RegistrationState.new(registration_state_params)

    respond_to do |format|
      if @registrationstate.save
        format.html { redirect_to registration_states_path, notice: 'RegistrationState was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @registrationstate.update(registration_state_params)
        format.html { redirect_to registration_states_path, notice: 'RegistrationState was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @registrationstate.destroy
    respond_to do |format|
      format.html { redirect_to registration_states_url, notice: 'RegistrationState was successfully destroyed.' }
    end
  end

  private
    def set_registration_state
      @registrationstate = RegistrationState.find(params[:id])
    end

    def registration_state_params
      params.require(:registration_state).permit(:name)
    end
end
