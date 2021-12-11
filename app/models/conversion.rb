# app/models/conversion.rb
class Conversion < ApplicationRecord
  # associations
  belongs_to :currency
  belongs_to :to, class_name: "Currency"

  # validations
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :to_id, uniqueness: { scope: :currency_id }
  # rubocop:enable Rails/UniqueValidationWithoutIndex
  validate :currency_equal_to_to

  def currency_equal_to_to
    errors.add(:to, "equal to from") if currency == to
  end
end
