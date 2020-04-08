class TokensController < ApplicationController
  before_action :set_token, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except: [ :destroy]}, site_admin: :all
  # GET /tokens
  def index
    @mylist = current_user.tokens
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
    @token.user_id = current_user.id

    if @token.save
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

  def status_search
    @search = Token.all.where(id: params[:q])
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
      params.require(:token).permit(:phoneno, :user_id,:status)
    end
end
