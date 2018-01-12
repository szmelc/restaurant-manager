require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  let(:admin)  { FactoryBot.create(:user, :admin) }
  let(:user)  { FactoryBot.create(:user) }

  describe '#index' do
    context 'as admin' do
      before do
        sign_in admin
      end
      it 'reponse is successful' do
        get :index
        expect(response).to be_success
      end

      it 'has http status 200' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context 'as regular user' do
      it 'response is successful' do
        get :index
        expect(response).to be_success
      end

      it 'has http status 200' do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

  describe '#new' do
    context 'as admin' do
      before do
        sign_in admin
      end

      it 'response is successful' do
        get :new
        expect(response).to be_success
      end

      it 'has http status 200' do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    context 'as unauthorized user' do
      before do
        sign_in user
      end

      it 'restricts access to the form' do
        expect{ get :new }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe '#create' do
    context 'as admin' do
      before do
        sign_in admin
      end
      context 'with valid attributes' do
        let(:dish_params)  { FactoryBot.attributes_for(:dish) }

        it 'is valid with necessary params' do
          expect {
            post :create, params: { dish: dish_params }
          }.to change(Dish, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        context 'without name' do
          let(:dish_params)  { FactoryBot.attributes_for(:dish, :without_name) }

          it 'is invalid' do
            expect {
              post :create, params: { dish: dish_params }
            }.not_to change(Dish, :count)
          end
        end

        context 'without a price' do
          let(:dish_params)  { FactoryBot.attributes_for(:dish, :without_price) }
          it 'is invalid' do
            expect {
              post :create, params: { dish: dish_params }
            }.not_to change(Dish, :count)
          end
        end

        context 'with invalid price format' do
          let(:dish_params)  { FactoryBot.attributes_for(:dish, :invalid_price_format) }
          it 'is invalid' do
            expect {
              post :create, params: { dish: dish_params }
            }.not_to change(Dish, :count)
          end
        end
      end
    end

    context 'as unathorized user' do
      let(:dish_params)  { FactoryBot.attributes_for(:dish) }

      before do
        sign_in user
      end

      it 'restricts access' do
        post :create, params: { dish: dish_params }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#update' do
    let(:dish)  { FactoryBot.create(:dish) }

    context 'as admin' do
      before do
        sign_in admin
      end

      it 'updates dish info' do
        dish_params = FactoryBot.attributes_for(:dish, name: 'Goloneczka')
        patch :update, params: { id: dish.id, dish: dish_params }
        expect(dish.reload.name).to eq('Goloneczka')
      end
    end

    context 'as unathorized user' do
      before do
        sign_in user
      end

      it 'restricts access' do
        dish_params = FactoryBot.attributes_for(:dish, name: 'Goloneczka')
        patch :update, params: { id: dish.id, dish: dish_params }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe '#destroy' do
    let!(:dish)  { FactoryBot.create(:dish) }
    let!(:dish2)  { FactoryBot.create(:dish) }

    context 'as admin' do
      before do
        sign_in admin
      end

      it 'destroys a dish' do
        expect {
          delete :destroy, params: { id: dish2.id }
        }.to change(Dish, :count).by(-1)
      end
    end

    context 'as unauthorized user' do
      before do
        sign_in user
      end

      it 'restricts access' do
        expect {
          delete :destroy, params: { id: dish2.id }
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
