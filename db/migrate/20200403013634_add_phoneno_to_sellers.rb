class AddPhonenoToSellers < ActiveRecord::Migration[6.0]
  def change
    add_column :sellers, :phoneno, :string
  end
end
