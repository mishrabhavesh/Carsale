class CreateKilometerdrivens < ActiveRecord::Migration[6.0]
  def change
    create_table :kilometerdrivens do |t|
      t.string :name

      t.timestamps
    end
  end
end
