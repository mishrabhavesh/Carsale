class AddSellerIndexing < ActiveRecord::Migration[6.0]
  def change
  	    add_index :car_costs, :condition
  	    add_index :car_costs, :price
  	    add_index :locations, :address
  	    add_index :tokens, :phoneno

  end
end
