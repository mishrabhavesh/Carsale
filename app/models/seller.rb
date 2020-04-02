class Seller < ApplicationRecord
    belongs_to :model
    belongs_to :brand
    belongs_to :city
    belongs_to :kilometerdriven
    belongs_to :registrationstate
    belongs_to :registrationyear
    belongs_to :variant
    validates :model_id, presence: true
    validates :brand_id, presence: true
    validates :registrationstate_id presence: true
    validates :model_id, presence: true
    validates :city_id, presence: true
    validates :kilometerdriven_id, presence: true
    validates :registrationyear_id, presence: true
end