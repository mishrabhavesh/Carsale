class UpdateModelForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :models, :brands
  add_foreign_key :models, :brands, dependent: :delete
  end
end
