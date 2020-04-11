class KilometerdrivensController < ApplicationController
  before_action :set_kilometerdriven, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}
  # GET /kilometerdrivens
  # GET /kilometerdrivens.json
  def index
    @kilometerdrivens = Kilometerdriven.all
  end

  # GET /kilometerdrivens/1
  # GET /kilometerdrivens/1.json
  def show
  end

  # GET /kilometerdrivens/new
  def new
    @kilometerdriven = Kilometerdriven.new
  end

  # GET /kilometerdrivens/1/edit
  def edit
  end

  # POST /kilometerdrivens
  # POST /kilometerdrivens.json
  def create
    @kilometerdriven = Kilometerdriven.new(kilometerdriven_params)

    respond_to do |format|
      if @kilometerdriven.save
        format.html { redirect_to @kilometerdriven, notice: 'Kilometerdriven was successfully created.' }
        format.json { render :show, status: :created, location: @kilometerdriven }
      else
        format.html { render :new }
        format.json { render json: @kilometerdriven.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kilometerdrivens/1
  # PATCH/PUT /kilometerdrivens/1.json
  def update
    respond_to do |format|
      if @kilometerdriven.update(kilometerdriven_params)
        format.html { redirect_to @kilometerdriven, notice: 'Kilometerdriven was successfully updated.' }
        format.json { render :show, status: :ok, location: @kilometerdriven }
      else
        format.html { render :edit }
        format.json { render json: @kilometerdriven.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kilometerdrivens/1
  # DELETE /kilometerdrivens/1.json
  def destroy
    @kilometerdriven.destroy
    respond_to do |format|
      format.html { redirect_to kilometerdrivens_url, notice: 'Kilometerdriven was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kilometerdriven
      @kilometerdriven = Kilometerdriven.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kilometerdriven_params
      params.require(:kilometerdriven).permit(:name)
    end
end
