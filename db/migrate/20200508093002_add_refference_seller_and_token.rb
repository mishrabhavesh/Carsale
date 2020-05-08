class AddRefferenceSellerAndToken < ActiveRecord::Migration[6.0]
  def change
    add_reference :tokens, :seller, foreign_key: true
  end
end
