class RemoveTokenNoColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :tokens, :token_no
    add_column :tokens, :seller_id, :integer
    add_column :sellers, :token_id, :integer 
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
