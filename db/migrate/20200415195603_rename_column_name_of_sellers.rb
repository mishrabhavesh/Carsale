class RenameColumnNameOfSellers < ActiveRecord::Migration[6.0]
  def change
    rename_column :sellers, :registrationyear_id, :registration_year_id
    rename_column :sellers, :registrationstate_id, :registration_state_id
    rename_column :sellers, :kilometerdriven_id, :kilometer_driven_id
    
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
