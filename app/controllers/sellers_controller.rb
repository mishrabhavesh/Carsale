class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :update, :new,  :destroy]}, Admin: :all, Seller: {except:[:index]}, Buyer: {except:[:show, :create, :new]}

  # GET /sellers
  # GET /sellers.json
  def index
    
    @sellers = Seller.all
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

  def search_model
    if params[:seller] and params[:seller][:model_id]
      @sellers = Seller.where(model_id: params[:seller][:model_id])
    end
  end

  def search_city
    if params[:seller] and params[:seller][:city_id]
      @sellers = Seller.where(city_id: params[:seller][:city_id])
    end
  end

  def search_brand
    if params[:seller] and params[:seller][:brand_id]
      @sellers = Seller.where(brand_id: params[:seller][:brand_id])
    end
  end

  def search_reg_year
    if params[:seller] and params[:seller][:registrationyear_id]
      @sellers = Seller.where(registrationyear_id: params[:seller][:registrationyear_id])
    end
  end
  
  def search_kilometer_driven
    if params[:seller] and params[:seller][:kilometerdriven_id]
      @sellers = Seller.where(kilometerdriven_id: params[:seller][:kilometerdriven_id])
    end
  end

  def search_variant
    if params[:seller] and params[:seller][:variant_id]
      @sellers = Seller.where(variant_id: params[:seller][:variant_id])
    end
  end

  def search_reg_state
    if params[:seller] and params[:seller][:registrationstate_id]
      @sellers = Seller.where(registrationstate_id: params[:seller][:registrationstate_id])
    end
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
      params.require(:seller).permit(:city_id, :brand_id, :model_id, :registrationyear_id, :registrationstate_id, :variant_id, :kilometerdriven_id,:token_id, :user_id)
    end
end
