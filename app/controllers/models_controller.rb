class ModelsController < ApplicationController
  before_action :set_model, only: [ :edit, :update, :destroy]
  access except: [ :edit, :create, :update, :new, :destroy, :index], user: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[ :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[ :edit, :create, :update, :new, :destroy, :index]}, message: "Only Admin can perform this"

  def index
    @models = Model.all
  end

  def new
    @model = Model.new
  end

  def edit
  end

  def create
    @model = Model.new(model_params)

      if @model.save
        format.html { redirect_to models_path, notice: 'Model was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
      if @model.update(model_params)
        format.html { redirect_to models_path, notice: 'Model was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @model.destroy
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
    end
  end

  private
    def set_model
      @model = Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:name,:brand_id)
    end
end
