class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key(:sellers, :cities)
    add_foreign_key(:sellers, :brands)
    add_foreign_key(:sellers, :kilometer_drivens)
    add_foreign_key(:sellers, :models)
    add_foreign_key(:sellers, :registration_states)
    add_foreign_key(:sellers, :registration_years)
    add_foreign_key(:sellers, :variants)
    add_foreign_key(:tokens, :users)
    add_foreign_key(:sellers, :users)
    add_foreign_key(:locations, :users) 
  end
end
