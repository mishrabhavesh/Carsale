class RegistrationStatesController < ApplicationController
  before_action :set_registration_state, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}

  # GET /registrationstates
  # GET /registrationstates.json
  def index
    @registrationstates = RegistrationState.all
  end

  # GET /registrationstates/1
  # GET /registrationstates/1.json
  def show
  end

  # GET /registrationstates/new
  def new
    @registrationstate = RegistrationState.new
  end

  # GET /registrationstates/1/edit
  def edit
  end

  # POST /registrationstates
  # POST /registrationstates.json
  def create
    @registrationstate = RegistrationState.new(registration_state_params)

    respond_to do |format|
      if @registrationstate.save
        format.html { redirect_to registration_states_path, notice: 'RegistrationState was successfully created.' }
        format.json { render :show, status: :created, location: @registrationstate }
      else
        format.html { render :new }
        format.json { render json: @registration_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrationstates/1
  # PATCH/PUT /registrationstates/1.json
  def update
    respond_to do |format|
      if @registrationstate.update(registration_state_params)
        format.html { redirect_to registration_states_path, notice: 'RegistrationState was successfully updated.' }
        format.json { render :show, status: :ok, location: @registrationstate }
      else
        format.html { render :edit }
        format.json { render json: @registration_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrationstates/1
  # DELETE /registrationstates/1.json
  def destroy
    @registrationstate.destroy
    respond_to do |format|
      format.html { redirect_to registration_states_url, notice: 'RegistrationState was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_state
      @registrationstate = RegistrationState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registration_state_params
      params.require(:registration_state).permit(:name)
    end
end
