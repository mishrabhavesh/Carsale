class RegistrationYear < ApplicationRecord
  validates :name, presence: true
   before_save :upcase_fields

  def upcase_fields
  self.name.upcase!
end
end
