class RegistrationYear < ApplicationRecord
  validates :name, presence: true
  before_save :upcase_fields
  validates :name, uniqueness: { case_sensitive: false }

  def upcase_fields
  self.name.upcase!
  end
end
