require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  include_context 'users'

  describe '#index' do
    context 'as an authorized user' do
      it 'reponds to browser request' do
        sign_in admin
        get :index
        expect(response).to be_success
      end

      it 'responds with 200' do
        sign_in admin
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context 'as an unauthorized user' do
      it 'restricts access to admin panel' do
        sign_in user
        expect{ get :index }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
