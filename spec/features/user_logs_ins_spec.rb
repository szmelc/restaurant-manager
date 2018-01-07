require 'rails_helper'

RSpec.feature "UserLogsIns", type: :feature do
  include_context 'users'
  let(:home) { Home.new }

  feature 'user logs in' do

    scenario 'regular user logs in' do
      log_in_as(user)
      save_and_open_page

    end

    scenario 'admin logs in' do
      log_in_as(admin)
    end
  end

  private

  def expect_successful_signup
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content(user.name)
  end

  def expect_regular_user_menu
    expect(page).not_to have_selector(:id, 'home_admin-navbutton')
  end

  def expect_admin_menu
    expect(page).to have_selector(:id, 'home_admin-navbutton')
  end
end
