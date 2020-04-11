class PagesController < ApplicationController
  access except: [:show, :edit, :create, :update, :new, :destroy, :index], user: {except:[:show, :edit, :create, :update, :new, :destroy, :index]}, Admin: :all

  def home
  
  end

  def about
  end
end
