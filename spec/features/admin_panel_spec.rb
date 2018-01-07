require 'rails_helper'

RSpec.feature "AdminPanel", type: :feature do
  include LoginSupport
  include_context 'users'
  let(:admin_panel) { AdminPage.new }
  # let(:main_page) { MainPage.new }

  feature 'admin navigates to admin panel' do
    scenario 'and sees proper admin panel' do
      log_in_as(admin)
      admin_panel.load
      expect(admin_panel).to be_displayed
      expect_proper_admin_panel
      expect_admin_panel_nav
      expect_proper_page_layout
    end

    scenario 'admin can add a user' do
      log_in_as(admin)
      admin_panel.load
      visit 'users/new'
      fill_in 'First Name', with: 'dupa jest obsrana'
      # create_user
      save_and_open_page
      expect(page).not_to have_content('User was not created.')
    end
  end

  feature 'user navigates to admin panel' do
    scenario 'and cannot sccess admin panel' do
      log_in_as(user)
      # main_page.load
      # expect(main_page.menu).not_to have_admin_button
      # expect(admin_panel.load).to raise_error(CanCan::AccessDenied)
    end
  end

  private

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
end
