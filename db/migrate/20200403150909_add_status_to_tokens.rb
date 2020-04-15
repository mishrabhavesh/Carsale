class AddStatusToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :status, :string, default: "processing"
    #Ex:- :default =>''
  end
end
