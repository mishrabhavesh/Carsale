class AdminController < ApplicationController
  access except: [ :admin], user: {except:[ :admin]}, Admin: :all, Seller: {except:[ :admin]}, Buyer: {except:[ :admin]}
  def admin
  
  end
end