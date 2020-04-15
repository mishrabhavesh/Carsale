class RenameTableName < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :carcosts, :car_costs
    rename_table :kilometerdrivens, :kilometer_drivens
    rename_table :registrationstates, :registration_states
    rename_table :registrationyears, :registration_years
  end

  def self.down
    rename_table :car_costs, :carcosts
    rename_table :kilometer_drivens, :kilometerdrivens
    rename_table :registration_states, :registrationstates
    rename_table :registration_years, :registrationyears
  end
end
