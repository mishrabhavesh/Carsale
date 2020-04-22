class Location < ApplicationRecord
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  validates_uniqueness_of :address, on: :create, message: "must be unique"
 before_save :upcase_fields

  def upcase_fields
	  self.name.upcase!
  end
end
