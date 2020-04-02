class Seller < ApplicationRecord
    belongs_to :model
    belongs_to :brand
    belongs_to :city
    belongs_to :kilometerdriven
    belongs_to :registrationstate
    belongs_to :registrationyear
    belongs_to :variant
end