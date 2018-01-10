require 'rails_helper'

RSpec.feature "UserPages", type: :feature do
  include_context 'users'
  let(:another_user)    { FactoryBot.create(:user) }
  let(:user_page)       { UserPage.new }

  feature 'logged user goes to user page' do

    context 'is a displayed user' do
      before do
        log_in_as user
        user_page.load(id: user.id)
      end

      scenario 'expects proper layout' do
        expect(user_page).to have_user_info
        expect(user_page).to have_user_colleagues
        expect(user_page).not_to have_orders_chart
      end

      scenario 'and sees his personal details' do
        expect_user_details(user)
      end

      scenario 'can access user settings from user info panel' do
        expect(user_page.user_info).to have_settings_button
      end
    end

    context 'is not the displayed user' do
      before do
        log_in_as another_user
        user_page.load(id: user.id)
      end

      scenario 'expects proper layout' do
        expect(user_page).to have_user_info
        expect(user_page).to have_user_colleagues
        expect(user_page).not_to have_orders_chart
      end

      scenario 'and sees colleagues personal details' do
        expect_to_see_colleagues_details(user)
        expect_not_to_see_logged_in_user_details(another_user)
      end

      scenario 'cannot go to settings' do
        expect(user_page.user_info).not_to have_settings_button
      end

      scenario 'can see other users pages' do
      end
    end

    context 'is admin' do
      before do
        log_in_as admin
        user_page.load(id: user.id)
      end

      scenario 'expects proper layout' do
        expect(user_page).to have_user_info
        expect(user_page).to have_user_colleagues
        expect(user_page).to have_orders_chart
      end

      context 'visits other users pages' do
        scenario 'expects to see users income' do
          expect(user_page.orders_chart).to have_content("User's Daily Income:")
        end

        scenario 'can see other users order charts' do
          expect(user_page).to have_orders_chart
        end
      end

      context 'visits his profile page' do
        before do
          user_page.load(id: admin.id)
        end

        scenario 'expects to see his income' do
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
