class CreateCarcosts < ActiveRecord::Migration[6.0]
  def change
    create_table :carcosts do |t|
      t.string :condition
      t.string :price

      t.timestamps
    end
  end
end
