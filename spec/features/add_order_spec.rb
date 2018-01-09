require 'rails_helper'

RSpec.feature "AddOrders", type: :feature do
  include_context 'users'
  let(:order_page)  { AddOrder.new }
  let!(:dish) { FactoryBot.create(:dish) }

  scenario 'admin wants to take an order', js: true do
    log_in_as admin
    order_page.load
    expect_form_fields
    select_dish
    click_link 'Dish List'
  end


  private

  def expect_form_fields
    expect(order_page).to have_select_dish
    expect(order_page).to have_select_quantity
    expect(order_page).to have_price_field
    # expect(order_page).to have_remove_dish
  end

  def select_dish
    order_page.select_dish.select(dish.name)
    order_page.select_quantity.click
  end
end
