# app/models/currency.rb
class Currency < ApplicationRecord
  # validations
  validates :iso_code, presence: true, uniqueness: { case_sensitive: false }
  validates :rate, presence: true

  # scopes
  scope :base, -> { find_by(is_base: true) }

  # associations
  has_many :conversions, dependent: :destroy
end
