class City < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, on: :create, message: "must be unique"
end
