class PagesController < ApplicationController
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all, message: "Only Admin can perform this"

  def home
  
  end

end
