class RemoveFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :phone_no
    remove_column :users, :name
  end
end
