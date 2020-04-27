class AddIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :cities, :name, unique: true
    add_index :brands, :name, unique: true
    add_index :kilometer_drivens, :name, unique: true
    add_index :registration_states, :name, unique: true
    add_index :registration_years, :name, unique: true
    add_index :variants, :name, unique: true
    add_index :models, :name, unique: true
    add_index :car_costs, :condition, unique: true
    add_index :car_costs, :price, unique: true
    add_index :locations, :address
    add_index :tokens, :phoneno
    #Ex:- add_index("admin_users", "username")
  end
end
