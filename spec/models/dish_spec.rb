require 'rails_helper'

RSpec.describe Dish do
  let(:dish) { FactoryBot.build(:dish) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }

  context 'dish is added' do
    it 'is invalid when price is not an integer' do
      dish.price = 'abc'
      dish.save
      expect(dish).not_to be_valid
      expect(dish.errors[:price]).to include('is not a number')
    end
  end
end
