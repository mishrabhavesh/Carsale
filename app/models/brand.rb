class Brand < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, on: :create, message: "must be unique"
   before_save :upcase_fields

  def upcase_fields
  self.name.upcase!
end
end
