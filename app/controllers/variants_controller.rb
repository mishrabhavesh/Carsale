class VariantsController < ApplicationController
  before_action :set_variant, only: [ :edit, :update, :destroy]
  access except: [ :edit, :create, :update, :new, :destroy, :index], user: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[ :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  
  def index
    @variants = Variant.all
  end

  def new
    @variant = Variant.new
  end

  def edit
  end

  
  def create
    @variant = Variant.new(variant_params)

      if @variant.save
        format.html { redirect_to variants_path, notice: 'Variant was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  def update
      if @variant.update(variant_params)
        format.html { redirect_to variants_path, notice: 'Variant was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  def destroy
    @variant.destroy
      format.html { redirect_to variants_url, notice: 'Variant was successfully destroyed.' }
    end
  end

  private
    def set_variant
      @variant = Variant.find(params[:id])
    end

    def variant_params
      params.require(:variant).permit(:name)
    end
end
