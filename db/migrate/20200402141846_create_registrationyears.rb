class CreateRegistrationyears < ActiveRecord::Migration[6.0]
  def change
    create_table :registrationyears do |t|
      t.string :name

      t.timestamps
    end
  end
end
