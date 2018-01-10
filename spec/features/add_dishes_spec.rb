require 'rails_helper'

RSpec.feature "AddDishes", type: :feature do
  include_context 'users'
  let(:dish)  { FactoryBot.build_stubbed(:dish) }
  let(:dishes_page)  { Dishes.new }

  feature 'admin wants to add a dish' do
    context 'fills the form correctly' do
      scenario 'and adds it successfuly' do
        load_dishes_page_as admin
        expect(dishes_page).to have_add_dish
        dishes_page.add_dish.click
        fill_in_dish_form
        expect{ click_button 'Save changes' }.to change(Dish, :count).by(1)
        expect_dish_to_be_displayed
      end

      scenario 'and wants to edit dish that has just been created' do
        load_dishes_page_as admin
        expect(dishes_page).to have_add_dish
        dishes_page.add_dish.click
        # fill_in_dish_form
        # click_button 'Save changes'
        # click_link 'Shrimps'
        # save_and_open_page
      end
    end

    feature 'admin wants to edit dish' do
      let!(:dish)  { FactoryBot.create(:dish) }
      scenario 'edits it successfuly', js: true do
        dishes_page.load
        click_link 'Shrimps'
        # dopisz
      end
    end

    context 'but fills the form incorrectly' do
      scenario 'name is missing' do
        load_dishes_page_as admin
        dishes_page.add_dish.click
        fill_in_dish_form_without_name
        expect { click_button 'Save changes' }.not_to change(Dish, :count)
        expect(page).to have_content("Name can't be blank")
      end

      scenario 'price has invalid format' do
        load_dishes_page_as admin
        dishes_page.add_dish.click
        fill_in_dish_form_with_invalid_price
        expect { click_button 'Save changes' }.not_to change(Dish, :count)
        expect(page).to have_content("Price is not a number")
      end
    end
  end

  feature 'unauthorized user wants to add new dish' do
    scenario 'and cannot find add-dish button' do
      load_dishes_page_as user
      screenshot_and_open_image
      expect(dishes_page).not_to have_add_dish
    end
  end


  private

  def load_dishes_page_as(user)
    log_in_as(user)
    dishes_page.load
  end

  def fill_in_dish_form
    fill_in 'Name', with: dish.name
    fill_in 'Price', with: dish.price
    fill_in 'Description', with: dish.description
  end

  def fill_in_dish_form_without_name
    fill_in 'Price', with: dish.price
    fill_in 'Description', with: dish.description
  end

  def fill_in_dish_form_with_invalid_price
    fill_in 'Name', with: dish.name
    fill_in 'Price', with: '2-'
    fill_in 'Description', with: dish.description
  end

  def expect_dish_to_be_displayed
    expect(page).to have_current_path('/dishes')
    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.price)
  end
end
