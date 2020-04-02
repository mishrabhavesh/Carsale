class RegistrationyearsController < ApplicationController
  before_action :set_registrationyear, only: [:show, :edit, :update, :destroy]

  # GET /registrationyears
  # GET /registrationyears.json
  def index
    @registrationyears = Registrationyear.all
  end

  # GET /registrationyears/1
  # GET /registrationyears/1.json
  def show
  end

  # GET /registrationyears/new
  def new
    @registrationyear = Registrationyear.new
  end

  # GET /registrationyears/1/edit
  def edit
  end

  # POST /registrationyears
  # POST /registrationyears.json
  def create
    @registrationyear = Registrationyear.new(registrationyear_params)

    respond_to do |format|
      if @registrationyear.save
        format.html { redirect_to @registrationyear, notice: 'Registrationyear was successfully created.' }
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
      if @registrationyear.update(registrationyear_params)
        format.html { redirect_to @registrationyear, notice: 'Registrationyear was successfully updated.' }
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
      format.html { redirect_to registrationyears_url, notice: 'Registrationyear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrationyear
      @registrationyear = Registrationyear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registrationyear_params
      params.require(:registrationyear).permit(:name)
    end
end
