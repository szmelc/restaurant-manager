require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  before do
    @user = FactoryGirl.create(:user, :admin)
  end

  describe '#index' do
    sign_in @user
  end
end
