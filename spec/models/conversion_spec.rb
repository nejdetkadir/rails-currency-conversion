require 'rails_helper'

RSpec.describe Conversion, type: :model do
  it "have a valid factory" do
    expect(build(:conversion)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:currency) }
    it { is_expected.to belong_to(:to).class_name('Currency') }
  end
end
