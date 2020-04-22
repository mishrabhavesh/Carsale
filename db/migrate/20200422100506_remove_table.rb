class RemoveTable < ActiveRecord::Migration[6.0]
  def change
  	drop_table :brandmodels
  	remove_column :sellers, :name
  	remove_column :sellers, :phoneno
  end
end
