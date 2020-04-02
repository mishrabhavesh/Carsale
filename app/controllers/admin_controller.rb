class AdminController < ApplicationController
  access except: [ :admin], user: {except:[ :admin]}, site_admin: :all

  def admin
    
  end
end
