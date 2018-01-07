require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  let(:user)    { FactoryBot.create(:user) }
  let(:admin)   { FactoryBot.create(:user, :admin) }

  # describe '#new' do
  #   context 'as an authorized user' do
  #     before do
  #       @admin = FactoryBot.create(:user, :admin)
  #     end

  #     login_as @admin, scope: :user
  #     get :new
  #     expect(response).to be_success
  #   end
  # end
end
