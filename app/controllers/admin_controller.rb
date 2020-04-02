class AdminController < ApplicationController
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, site_admin: :all
  def index
    
  end
end
