require 'rails_helper'

RSpec.feature "AddDishes", type: :feature do
  include_context 'users'
  let(:dish)  { FactoryBot.build_stubbed(:dish) }
  let(:dishes_page)  { Dishes.new }

  feature 'admin wants to add a dish' do
    scenario 'adds it successfuly' do
      load_dishes_page_as admin
      expect(dishes_page).to have_add_dish
      dishes_page.add_dish.click
      fill_in_dish_form
      expect_dish_to_be_displayed
    end

    scenario 'name is missing' do
      load_dishes_page_as admin
      dishes_page.add_dish.click
      fill_in_dish_form_without_name
    end
  end


  private

  def load_dishes_page_as(user)
    log_in_as(admin)
    dishes_page.load
  end

  def fill_in_dish_form
    fill_in 'Name', with: dish.name
    fill_in 'Price', with: dish.price
    fill_in 'Description', with: dish.description
    click_button 'Save changes'
  end

  def fill_in_dish_form_without_name
    fill_in 'Price', with: dish.price
    fill_in 'Description', with: dish.description
    click_button 'Save changes'
  end

  def expect_dish_to_be_displayed
    expect(page).to have_current_path('/dishes')
    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.price)
  end
end
