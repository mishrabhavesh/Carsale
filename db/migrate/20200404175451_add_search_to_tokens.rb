class AddSearchToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :query, :string
  end
end
