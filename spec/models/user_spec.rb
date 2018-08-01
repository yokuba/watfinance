require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it 'has_many values' do
      association = described_class.reflect_on_association(:values)
      expect(association.macro).to eq :has_many
    end
  end
end