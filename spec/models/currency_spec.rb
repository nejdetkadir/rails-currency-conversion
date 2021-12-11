require 'rails_helper'

RSpec.describe Currency, type: :model do
  it "have a valid factory" do
    expect(build(:currency)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to have_many(:conversions).dependent(:destroy) }
  end
end
