require 'rails_helper'

RSpec.feature "AddOrders", type: :feature do
  include_context 'users'
  let(:new_order_page)  { AddOrder.new }
  let(:orders_page)     { OrdersPage.new}

  feature 'user wants to take an order' do
    let!(:dishes)  { FactoryBot.create_list(:dish, 5) }
    before do
      log_in_as user
      new_order_page.load
    end

    scenario 'add dish form has all elements' do
      expect(new_order_page.add_dish_form).to have_select_dish
      expect(new_order_page.add_dish_form).to have_select_quantity
      expect(new_order_page.add_dish_form).to have_price_field
    end

    scenario 'user takes an order' do
      select dishes.last.name, from: 'order_meals_attributes_0_name'
      expect{
        click_button 'Add Order'
      }.to change(user.orders, :count).by(1)
    end

    scenario 'after taking an order is redirected to orders index' do
      select dishes.last.name, from: 'order_meals_attributes_0_name'
      click_button 'Add Order'
      expect(orders_page).to be_displayed
    end
  end
end
