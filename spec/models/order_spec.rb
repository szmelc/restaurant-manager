require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:order)   { FactoryBot.create(:order) }
  let!(:user)    { FactoryBot.create(:user) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_and_belong_to_many(:meals) }
end
