class AddTokenNoToSellers < ActiveRecord::Migration[6.0]
  def change
    add_column :sellers, :token_no, :integer
  end
end
