class BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]
  access except: [ :edit, :create, :update, :new, :destroy, :index], user: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end


  def edit
  end

  def create
    @brand = Brand.new(brand_params)

      if @brand.save
        format.html { redirect_to brands_path, notice: 'Brand was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
      if @brand.update(brand_params)
        format.html { redirect_to brands_path, notice: 'Brand was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @brand.destroy
      format.html { redirect_to brands_url, notice: 'Brand was successfully destroyed.' }
    end
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name)
    end
end
