require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:admin)  { FactoryBot.create(:user, :admin) }
  let(:user)   { FactoryBot.create(:user) }
  let(:order)  { FactoryBot.create(:order, user: user) }

  describe '#index' do
    context 'as a regular user' do
      before do
        sign_in user
      end

      it 'returns 200' do
        get :index
        expect(response).to have_http_status(200)
      end

      it 'response is successful' do
        get :index
        expect(response).to be_success
      end
    end

    context 'as admin' do
      before do
        sign_in admin
      end

      it 'returns 200' do
        get :index
        expect(response).to have_http_status(200)
      end

      it 'response is successful' do
        get :index
        expect(response).to be_success
      end
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

      it 'response is successful' do
        get :new
        aggregate_failures do
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'as a regular user' do
      before do
        sign_in user
      end

      it 'response is successful' do
        get :new
        aggregate_failures do
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
      end
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

    # context 'with invalid attributes' do
    #   context 'without a user' do
    #     before do
    #       sign_in _user
    #     end

    #     it 'does not add order' do
    #       order_params = FactoryBot.attributes_for(:order, user_id: nil)
    #       expect {
    #         post :create, params: { order: order_params }
    #       }.not_to change(user.orders, :count)
    #     end
    #   end
    # end
  end
end
