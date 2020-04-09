class CarcostsController < ApplicationController
  before_action :set_carcost, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /carcosts
  def index
    @carcosts = Carcost.all
  end

  # GET /carcosts/1
  def show
  end

  # GET /carcosts/new
  def new
    @carcost = Carcost.new
  end

  # GET /carcosts/1/edit
  def edit
  end

  # POST /carcosts
  def create
    @carcost = Carcost.new(carcost_params)

    if @carcost.save
      redirect_to @carcost, notice: 'Carcost was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carcosts/1
  def update
    if @carcost.update(carcost_params)
      redirect_to @carcost, notice: 'Carcost was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carcosts/1
  def destroy
    @carcost.destroy
    redirect_to carcosts_url, notice: 'Carcost was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carcost
      @carcost = Carcost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def carcost_params
      params.require(:carcost).permit(:condition, :price)
    end
end
