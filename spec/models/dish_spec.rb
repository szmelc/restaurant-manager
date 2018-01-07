require 'rails_helper'

RSpec.describe Dish do
  let(:dish) { FactoryBot.create(:dish) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }
end
