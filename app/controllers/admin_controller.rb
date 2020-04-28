class AdminController < ApplicationController
  access except: [ :admin], user: {except:[ :admin]}, Admin: :all, Seller: {except:[ :admin]}, Buyer: {except:[ :admin]}, message: "Only Admin can perform this"
  def admin
  
  end
end