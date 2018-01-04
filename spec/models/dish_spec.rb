require 'rails_helper'

RSpec.describe Dish do
  let(:dish) { FactoryBot.create(:dish) }

  context 'valid dish' do
    context 'a dish with a name is added' do
      it 'is valid with a name' do
        expect(dish).to be_valid
      end
    end
  end

  context 'invalid dish' do
    it 'is invalid without a name ' do
      dish.name = nil
      expect(dish).not_to be_valid
    end

    it 'expects dish to have a name' do
      dish.name = nil
      expect(dish.save).to include("can't be blank")
    end
  end
end
