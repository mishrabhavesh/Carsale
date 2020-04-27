class CarCost < ApplicationRecord
  validates :condition, presence: true
  validates :price, presence: true
  validates :condition, uniqueness: { case_sensitive: false }
  validates :price, uniqueness: { case_sensitive: false }
end