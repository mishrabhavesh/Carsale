class SellersController < ApplicationController
	before_action :authenticate_user!
	access except: [  :create, :new , :index], user: {except:[ :create, :new , :index]}, Admin: :all ,Buyer: {except:[:new, :create]}, Seller: {except: [:index]}, message: "Only Admin can perform this"
	include SellersHelper

	def index
		if params[:search].present?
		@sellers =   search(params[:search])
		else
			@sellers = Seller.all
		end
	end 

	def new
		@seller = Seller.new
	end

	def search_model
			@sellers = Seller.car_model( params[:model_id])
	end

	def search_city
			@sellers = Seller.car_city( params[:city_id])
	end

	def search_brand
			@sellers = Seller.car_brand( params[:brand_id])
	end

	def search_registration_year
			@sellers = Seller.car_reg_year( params[:registration_year_id])
	end
	
	def search_kilometer_driven
			@sellers = Seller.car_kilometer_driven( params[:kilometer_driven_id])
	end

	def search_variant
			@sellers = Seller.car_variant( params[:variant_id])
	end

	def search_registration_state
			@sellers = Seller.car_reg_state( params[:registration_state_id])
	end

  def purchase

  end
	
	def create
		@seller = Seller.new(seller_params)
		@seller.user_id = current_user.id
			if @seller.save
				redirect_to new_token_path, notice: 'Add was sucessfully posted.' 
			else
				render :new
			end
	end


	private

		def seller_params
			params.require(:seller).permit(:city_id, :brand_id, :model_id, :registration_year_id, :registration_state_id, :variant_id, :kilometer_driven_id,:token_id, :user_id)
		end
end
