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

	
	def create
		@seller = Seller.new(seller_params)
		@seller.user_id = current_user.id
		
		respond_to do |format|
			if @seller.save
				format.html { redirect_to new_token_path, notice: 'Add was sucessfully posted.' }
			else
				format.html { render :new }
			end
		end
	end


	private

		def seller_params
			params.require(:seller).permit(:city_id, :brand_id, :model_id, :registration_year_id, :registration_state_id, :variant_id, :kilometer_driven_id,:token_id, :user_id)
		end
end
