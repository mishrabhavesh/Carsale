class Location < ApplicationRecord
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
    validates :address, uniqueness: { case_sensitive: false }
 before_save :upcase_fields

  def upcase_fields
	  self.name.upcase!
  end
end
