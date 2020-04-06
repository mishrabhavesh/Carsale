class RemoveSellerIdFromSellers < ActiveRecord::Migration[6.0]
  def change
    remove_column :sellers, :token_id
    remove_column :tokens, :seller_id
    remove_column :tokens, :query
  end
end
