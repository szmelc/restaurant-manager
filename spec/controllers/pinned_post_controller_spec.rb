require 'rails_helper'

RSpec.describe PinnedPostsController, type: :controller do
  include_context 'users'

  describe '#new' do
    context 'as admin' do
      it 'allows to add pinned post' do
        sign_in admin
        get :new
        expect(response).to be_success
      end
    end

    context 'as user' do
      it 'restricts access to pinned post form' do
        sign_in user
        expect { get :new }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
