class AdminController < ApplicationController
  access except: [ :admin], user: {except:[ :admin]}, site_admin: :all

  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, site_admin: :all
  def admin
    
  end
end