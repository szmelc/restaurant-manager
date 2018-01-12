require 'rails_helper'

RSpec.feature "UserPages", type: :feature do
  include_context       'users'

  let(:another_user)    { FactoryBot.create(:user) }
  let(:user_page)       { UserPage.new }

  feature 'I want user to go to user page' do
    context 'be a displayed user' do
      before do
        log_in_as user
        user_page.load(id: user.id)
      end

      scenario 'expect proper layout' do
        expect(user_page).to have_user_info
        expect(user_page).to have_user_colleagues
        expect(user_page).not_to have_orders_chart
      end

      scenario 'see his personal details' do
        expect_user_details(user)
      end

      scenario 'be able to access user settings from user info panel' do
        expect(user_page.user_info).to have_settings_button
      end
    end

    context 'not be the displayed user' do
      before do
        log_in_as another_user
        user_page.load(id: user.id)
      end

      scenario 'expect proper layout' do
        expect(user_page).to have_user_info
        expect(user_page).to have_user_colleagues
        expect(user_page).not_to have_orders_chart
      end

      scenario 'see colleagues personal details' do
        expect_to_see_colleagues_details(user)
        expect_not_to_see_logged_in_user_details(another_user)
      end

      scenario 'not be able to go to settings' do
        expect(user_page.user_info).not_to have_settings_button
      end

      scenario 'be able to see other users pages' do
      end
    end

    context 'be admin' do
      before do
        log_in_as admin
        user_page.load(id: user.id)
      end

      scenario 'expect proper layout' do
        expect(user_page).to have_user_info
        expect(user_page).to have_user_colleagues
        expect(user_page).to have_orders_chart
      end

      context 'be able to visit other users pages' do
        scenario 'be able to see other users income' do
          expect(user_page.orders_chart).to have_content("User's Daily Income:")
        end

        scenario 'see other users order charts' do
          expect(user_page).to have_orders_chart
        end
      end

      context 'visit his profile page' do
        before do
          user_page.load(id: admin.id)
        end

        scenario 'be able to see his income' do
          expect(user_page.orders_chart).to have_content('Your Daily Income:')
        end
      end
    end



  end

  private

  def expect_user_details(user)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.phonenumber)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.description)
  end

  def expect_not_to_see_logged_in_user_details(user)
    expect(page).not_to have_content(user.name)
    expect(page).not_to have_content(user.email)
  end

  def expect_to_see_colleagues_details(user)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end
