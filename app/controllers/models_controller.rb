class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}

  # GET /models
  # GET /models.json
  def index
    @models = Model.all
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:model).permit(:name)
    end
end
