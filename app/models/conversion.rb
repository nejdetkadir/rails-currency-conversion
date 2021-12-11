# app/models/conversion.rb
# rubocop:disable Style/RedundantSelf
class Conversion < ApplicationRecord
  # associations
  belongs_to :currency
  belongs_to :to, class_name: "Currency"

  # validations
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :to_id, uniqueness: { scope: :currency_id }
  # rubocop:enable Rails/UniqueValidationWithoutIndex
  validate :currency_equal_to_to

  # scopes
  default_scope { order(created_at: :desc) }

  # callbacks
  after_create_commit do
    broadcast_prepend_to 'conversions'
  end

  after_update_commit do
    broadcast_replace_to 'conversions'
  end

  after_destroy_commit do
    broadcast_remove_to 'conversions', target: "conversion_#{self.id}"
  end

  def currency_equal_to_to
    errors.add(:to, "equal to from") if currency == to && !to.nil?
  end
end
# rubocop:enable Style/RedundantSelf
