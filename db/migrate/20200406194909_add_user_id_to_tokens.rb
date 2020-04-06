class AddUserIdToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :user_id, :integer
  end
end
