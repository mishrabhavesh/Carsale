class AddIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :cities, :name
    add_index :brands, :name
    add_index :kilometer_drivens, :name
    add_index :registration_states, :name
    add_index :registration_years, :name
    add_index :variants, :name
    add_index :models, :name
    #Ex:- add_index("admin_users", "username")
  end
end
