class TokensController < ApplicationController
  before_action :set_token, only: [:show, :edit, :update, :destroy]
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all ,Buyer: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Seller: {except:[:destroy]}

  def index
    @mylist = current_user.tokens
      @tokens = Token.all
  end

  def show
  
  end



  def new
    @token = Token.new

  end

  def edit
  end

  def create
    @token = Token.new(token_params)
    @token.user_id = current_user.id

    if @token.save
      redirect_to @token, notice: 'Token was successfully created.'
    else
      render :new
    end
  end

  def update
    if @token.update(token_params)
      redirect_to tokens_path, notice: 'Token was successfully updated.'
    else
      render :edit
    end
  end

  def status_search
    @search = Token.all.where(id: params[:q])
  end

  def destroy
    @token.destroy
    redirect_to tokens_url, notice: 'Token was successfully destroyed.'
  end

  private
    def set_token
      @token = Token.find(params[:id])
    end

    def token_params
      params.require(:token).permit(:phoneno, :user_id,:status)
    end
end
