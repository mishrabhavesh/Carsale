class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :name 
      t.integer :city_id , index: true
      t.integer :brand_id, index: true
      t.integer :model_id
      t.integer :registrationyear_id
      t.integer :registrationstate_id
      t.integer :variant_id
      t.integer :kilometerdriven_id
      t.timestamps
    end
  end
end