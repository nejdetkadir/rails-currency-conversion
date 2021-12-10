class Currency < ApplicationRecord
  # validations
  validates :iso_code, presence: true, uniqueness: { case_sensitive: false }
  validates :rate, presence: true

  # scopes
  scope :base, -> { find_by(is_base: true) }
end
