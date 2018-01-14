require 'rails_helper'
require 'shared_examples/controllers'

RSpec.describe OrdersController, type: :controller do
  let(:admin)  { FactoryBot.create(:user, :admin) }
  let(:user)   { FactoryBot.create(:user) }
  let(:order)  { FactoryBot.create(:order, user: user) }

  describe '#index' do
    context 'as user' do
    before do
      sign_in user
      get :index
    end

      it_behaves_like 'standard index action'
    end

    context 'as admin' do
      before do
        sign_in admin
      end

      it_behaves_like 'standard index action'
    end
  end

  describe '#new' do
    context 'as a guest' do
      it 'redirects to sign up page' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    context 'as admin' do
      before do
        sign_in admin
      end

      it_behaves_like 'standard new action'
    end

    context 'as a regular user' do
      before do
        sign_in user
      end

      it_behaves_like 'standard new action'
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      context 'as admin' do
        before do
          sign_in admin
        end

        it 'creates an order belonging to the admin' do
          order_params = FactoryBot.attributes_for(:order, user_id: admin.id)
          expect {
            post :create, params: { order: order_params }
          }.to change(admin.orders, :count).by(1)
        end
      end

      context 'as a regular user' do
        before do
          sign_in user
        end

        it 'creates and order belonging to the user' do
          order_params = FactoryBot.attributes_for(:order, user_id: user.id)
          expect {
            post :create, params: { order: order_params }
          }.to change(user.orders, :count).by(1)
        end
      end
    end
  end
end
