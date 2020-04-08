class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :update, :destroy]}, site_admin: :all

  # GET /sellers
  # GET /sellers.json
  def index
    if params[:seller] and params[:seller][:city_id]
      @sellers = Seller.where(city_id: params[:seller][:city_id])
    else
      @sellers = Seller.all
    end
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
  end

  # GET /sellers/new
  def new
    @seller = Seller.new
  end

  # GET /sellers/1/edit
  def edit
  end

  def search
    @cityid = City.all.where(name: params[:q]).pluck(:id)
    @seller = Seller.all.where(city_id: @cityid)
  end

  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(seller_params)
    @seller.user_id = current_user.id
    respond_to do |format|
      if @seller.save
        format.html { redirect_to new_token_path, notice: 'Seller was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to @seller, notice: 'Seller was successfully updated.' }
        format.json { render :show, status: :ok, location: @seller }
      else
        format.html { render :edit }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'Seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seller_params
      params.require(:seller).permit(:name, :city_id, :brand_id, :model_id, :registrationyear_id, :registrationstate_id, :variant_id, :kilometerdriven_id,:token_id, :user_id)
    end
end
