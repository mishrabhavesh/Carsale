class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.integer :city_id , null: false
      #Ex:- :null => false
      t.integer :brand_id, null: false
      t.integer :model_id, null: false
      t.integer :registrationyear_id, null: false
      t.integer :registrationstate_id, null: false
      t.integer :variant_id, null: false
      t.integer :kilometerdriven_id, null: false
      t.timestamps
    end
  end
end