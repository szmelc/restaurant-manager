require 'rails_helper'

RSpec.feature "UserSignUps", type: :feature do
  let(:user)    { FactoryBot.create(:user) }

  feature 'User signs up' do
    scenario 'with valid username and password' do
      visit root_path
      click_link 'Sign up'
      fill_in_user_details
      within '.form-actions' do
        click_button 'Sign Up'
      end
      expect(page).to have_content(user.name)
    end
  end

  private

  def fill_in_user_details
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'E-mail address', with: user.email
    fill_in 'City', with: user.city
    fill_in 'Password', with: user.password
    fill_in 'Confirm Password', with: user.password
  end
end
