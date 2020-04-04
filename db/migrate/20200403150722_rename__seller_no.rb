class RenameSellerNo < ActiveRecord::Migration[6.0]
  def change
    rename_column :tokens, :seller_no, :token_no
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
