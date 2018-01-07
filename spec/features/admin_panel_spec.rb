require 'rails_helper'

RSpec.feature "AdminPanel", type: :feature do
  include LoginSupport
  include_context 'users'
  let(:admin_panel) { AdminPage.new }
  let(:dish) { FactoryBot.build_stubbed(:dish) }
  let(:pinned_post) { FactoryBot.build_stubbed(:pinned_post) }

  feature 'admin navigates to admin panel' do
    scenario 'and sees proper admin panel' do
      go_to_admin_panel
      expect(admin_panel).to be_displayed
      expect_proper_admin_panel
      expect_admin_panel_nav
      expect_proper_page_layout
    end

    scenario 'and can add user' do
      go_to_admin_panel
      visit 'users/new'
      fill_in "user_first_name", with: 'dupa jest obsrana'
      create_user
      # expect(page).not_to have_content('User was not created.')
    end

    scenario 'and can add dish' do
      go_to_admin_panel
      visit 'dishes/new'
      create_dish
      expect_redirect_to_dish_list
    end

    scenario 'and can add pinned post' do
      go_to_admin_panel
      visit 'pinned_posts/new'
      create_pinned_post
      expect(page).to have_content(pinned_post.content)
    end
  end

  feature 'unathorized user navigates to admin panel' do
    scenario 'and cannot access admin panel' do
      log_in_as(user)
      # main_page.load
      # expect(main_page.menu).not_to have_admin_button
      # expect(admin_panel.load).to raise_error(CanCan::AccessDenied)
    end
  end

  private

  def go_to_admin_panel
    log_in_as(admin)
    admin_panel.load
  end

  def expect_proper_admin_panel
    aggregate_failures do
      expect(admin_panel).to have_employees_div
      expect(admin_panel).to have_income_div
      expect(admin_panel).to have_orders_div
    end
  end

  def expect_admin_panel_nav
    expect(admin_panel.menu).to have_admin_button
    expect(admin_panel.menu).to have_left_nav
    expect(admin_panel.menu).to have_avatar
    expect(admin_panel.menu).to have_search
  end

  def expect_proper_page_layout
    expect(admin_panel).to have_menu
    expect(admin_panel).to have_footer
  end

  def expect_redirect_to_dish_list
    aggregate_failures do
      expect(page).to have_title('Arbejder | Dish List')
      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.price)
    end
  end

  def create_user
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'E-mail address', with: user.email
    fill_in 'City', with: user.city
    fill_in 'Password', with: user.password
    fill_in 'Confirm password', with: user.password
    click_button 'Add'
  end

  def create_dish
    fill_in 'Name', with: dish.name
    fill_in 'Price', with: dish.price
    fill_in 'Description', with: dish.description
    click_button 'Save changes'
  end

  def create_pinned_post
    fill_in 'pinned_post_content', with: pinned_post.content
    click_button 'Post'
  end
end
