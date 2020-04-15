class CarCost < ApplicationRecord
  validates :condition, presence: true
  validates :price, presence: true
  validates_uniqueness_of :condition, on: :create, message: "must be unique"
  validates_uniqueness_of :price, on: :create, message: "must be unique"
end