require "rails_helper"

RSpec.describe Value, type: :model do
  context 'Associations' do
    it 'belongs_to user' do
      association = described_class.reflect_on_association(:user).macro
      expect(association).to eq :belongs_to
    end

    it 'belongs_to company' do
      association = described_class.reflect_on_association(:company).macro
      expect(association).to eq :belongs_to
    end
  end
end