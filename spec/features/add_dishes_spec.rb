require 'rails_helper'

RSpec.feature "AddDishes", type: :feature do
  include_context     'users'

  let(:dish)          { FactoryBot.build_stubbed(:dish) }
  let(:dishes_page)   { Dishes.new }

  feature 'I want admin to add a dish' do
    context 'fill the form correctly' do
      scenario 'and add it successfuly' do
        load_dishes_page_as admin
        expect_to_see_add_dish_button
        click_add_dish_button
        fill_in_dish_form
        expect { click_button 'Save changes' }.to change(Dish, :count).by(1)
        expect_dish_to_be_displayed
      end

      context 'attach a picture' do
        scenario 'and add a dish successfuly' do
          load_dishes_page_as admin
          expect_to_see_add_dish_button
          click_add_dish_button
          fill_in_dish_form
          attaches_a_picture
          expect { click_button 'Save changes' }.to change(Dish, :count).by(1)
        end
      end
    end

    context 'fill the form incorrectly' do
      context 'without a name' do
        scenario 'and receive an error' do
          load_dishes_page_as admin
          click_add_dish_button
          fill_in_dish_form_without_name
          expect { click_button 'Save changes' }.not_to change(Dish, :count)
          expect(page).to have_content("Name can't be blank")
        end
      end

      context 'with price with invalid format' do
        scenario 'and receive an error' do
          load_dishes_page_as admin
          click_add_dish_button
          fill_in_dish_form_with_invalid_price
          expect { click_button 'Save changes' }.not_to change(Dish, :count)
          expect(page).to have_content("Price is not a number")
        end
      end
    end
  end

  feature 'I want unauthorized user to add new dish' do
    scenario 'and not be able find add-dish button' do
      load_dishes_page_as user
      does_not_find_add_dish_button
    end
  end

  private

  def load_dishes_page_as(user)
    log_in_as(user)
    dishes_page.load
  end

  def click_add_dish_button
    dishes_page.add_dish.click
  end

  def expect_to_see_add_dish_button
    expect(dishes_page).to have_add_dish
  end

  def does_not_find_add_dish_button
    expect(dishes_page).not_to have_add_dish
  end

  def attaches_a_picture
    attach_file('dish[image]', 'app/assets/images/admin.png')
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
