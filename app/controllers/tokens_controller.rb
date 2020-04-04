class TokensController < ApplicationController
  before_action :set_token, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /tokens
  def index
    if params[:query].present?
      @tokens = Token.find(params[:query]).status
    end
    @tokens = Token.all
  end

  # GET /tokens/1
  def show
  end

  # GET /tokens/new
  def new
    @token = Token.new
  end

  # GET /tokens/1/edit
  def edit
  end

  # POST /tokens
  def create
    @token = Token.new(token_params)
    @token.seller_id = Seller.last.id
    
    if @token.save

      s = Seller.last
      s.token_id = Token.last.id
      s.save

      redirect_to @token, notice: 'Token was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tokens/1
  def update
    if @token.update(token_params)
      redirect_to @token, notice: 'Token was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tokens/1
  def destroy
    @token.destroy
    redirect_to tokens_url, notice: 'Token was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_token
      @token = Token.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def token_params
      params.require(:token).permit(:phoneno, :seller_id,:status)
    end
end
