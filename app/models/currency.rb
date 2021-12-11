# app/models/currency.rb
# rubocop:disable Style/RedundantSelf
class Currency < ApplicationRecord
  # validations
  validates :iso_code, presence: true, uniqueness: { case_sensitive: false }
  validates :rate, presence: true

  # scopes
  scope :base, -> { find_by(is_base: true) }

  # associations
  has_many :conversions, dependent: :destroy

  # callbacks
  after_update_commit do
    con = Conversion.arel_table
    Conversion.where(con[:currency_id].eq(self.id).or(con[:to_id].eq(self.id))).find_each(&:save)
  end

  def rate_of_base
    Currency.base.rate / self.rate
  end

  def rate_of_to(to)
    format("%5f", (self.rate_of_base / to.rate_of_base))
  end
end
# rubocop:enable Style/RedundantSelf
