require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'Associations' do
    it 'has_many values' do
      association = described_class.reflect_on_association(:values)
      expect(association.macro).to eq :has_many
    end

    it 'has_many users' do
    	association = described_class.reflect_on_association(:users)
    	expect(association.macro).to eq :has_many
    end
  end
end