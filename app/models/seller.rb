class Seller < ApplicationRecord
    belongs_to :brand_models
    belongs_to :brands
    belongs_to :cities
    belongs_to :kilometerdrivens
    belongs_to :registrationstates
    belongs_to :registrationyears
end