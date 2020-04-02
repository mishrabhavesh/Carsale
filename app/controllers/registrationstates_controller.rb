class RegistrationstatesController < ApplicationController
  before_action :set_registrationstate, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, site_admin: :all

  # GET /registrationstates
  # GET /registrationstates.json
  def index
    @registrationstates = Registrationstate.all
  end

  # GET /registrationstates/1
  # GET /registrationstates/1.json
  def show
  end

  # GET /registrationstates/new
  def new
    @registrationstate = Registrationstate.new
  end

  # GET /registrationstates/1/edit
  def edit
  end

  # POST /registrationstates
  # POST /registrationstates.json
  def create
    @registrationstate = Registrationstate.new(registrationstate_params)

    respond_to do |format|
      if @registrationstate.save
        format.html { redirect_to @registrationstate, notice: 'Registrationstate was successfully created.' }
        format.json { render :show, status: :created, location: @registrationstate }
      else
        format.html { render :new }
        format.json { render json: @registrationstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrationstates/1
  # PATCH/PUT /registrationstates/1.json
  def update
    respond_to do |format|
      if @registrationstate.update(registrationstate_params)
        format.html { redirect_to @registrationstate, notice: 'Registrationstate was successfully updated.' }
        format.json { render :show, status: :ok, location: @registrationstate }
      else
        format.html { render :edit }
        format.json { render json: @registrationstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrationstates/1
  # DELETE /registrationstates/1.json
  def destroy
    @registrationstate.destroy
    respond_to do |format|
      format.html { redirect_to registrationstates_url, notice: 'Registrationstate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrationstate
      @registrationstate = Registrationstate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registrationstate_params
      params.require(:registrationstate).permit(:name)
    end
end
