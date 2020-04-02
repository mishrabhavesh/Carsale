class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.integer :city_id
      t.integer :brand_id
      t.integer :model_id
      t.integer :registrationyear_id
      t.integer :registrationstate_id
      t.integer :variant_id
      t.integer :kilometerdriven_id
      t.timestamps
    end
  end
end