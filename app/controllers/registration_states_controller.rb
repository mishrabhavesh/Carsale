class RegistrationStatesController < ApplicationController
  before_action :set_registration_state, only: [ :edit, :update, :destroy]
  access except: [ :edit, :create, :update, :new, :destroy, :index], user: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[ :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  def index
    @registrationstates = RegistrationState.all
  end

  def new
    @registrationstate = RegistrationState.new
  end

  def edit
  end

  def create
    @registrationstate = RegistrationState.new(registration_state_params)

      if @registrationstate.save
        format.html { redirect_to registration_states_path, notice: 'RegistrationState was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
      if @registrationstate.update(registration_state_params)
        format.html { redirect_to registration_states_path, notice: 'RegistrationState was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @registrationstate.destroy
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
