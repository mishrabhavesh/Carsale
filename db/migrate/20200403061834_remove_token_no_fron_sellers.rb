class RemoveTokenNoFronSellers < ActiveRecord::Migration[6.0]
  def change
    remove_column :sellers, :token_no
  end
end
