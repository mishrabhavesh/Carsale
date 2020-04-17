class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:new]}, Seller: {except:[:destroy,:index]}

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

  # category search
  def search_model
      @sellers = Seller.car_model( params[:seller][:model_id])
  end

  def search_city
      @sellers = Seller.car_city( params[:seller][:city_id])
  end

  def search_brand
      @sellers = Seller.car_brand( params[:seller][:brand_id])
  end

  def search_reg_year
      @sellers = Seller.car_reg_year( params[:seller][:registration_year_id])
  end
  
  def search_kilometer_driven
      @sellers = Seller.car_kilometer_driven( params[:seller][:kilometer_driven_id])
  end

  def search_variant
      @sellers = Seller.car_variant( params[:seller][:variant_id])
  end

  def search_reg_state
      @sellers = Seller.car_reg_state( params[:seller][:registration_state_id])
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
        format.html { redirect_to @seller, notice: 'Post created.' }
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
      params.require(:seller).permit(:city_id, :brand_id, :model_id, :registration_year_id, :registration_state_id, :variant_id, :kilometer_driven_id,:token_id, :user_id)
    end
end
