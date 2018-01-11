require 'rails_helper'

RSpec.feature "Menus", type: :feature do
  include_context 'users'
  let(:homepage)  { Home.new }

  feature 'I want my menu to be specific for' do
    subject { homepage.menu }

    scenario 'admin' do
      log_in_as admin
      homepage.load
      expect(subject).to have_left_nav
      expect(subject).to have_admin_button
      expect(subject).to have_avatar
      expect(subject).to have_search
      expect(subject).not_to have_login_link
      expect(subject).not_to have_signup_link
    end

    scenario 'regular user' do
      log_in_as user
      homepage.load
      expect(subject).to have_left_nav

      expect(subject).to have_avatar
      expect(subject).to have_search
      expect(subject).not_to have_admin_button
      expect(subject).not_to have_login_link
      expect(subject).not_to have_signup_link
    end

    scenario 'guest' do
      homepage.load
      expect(subject).to have_left_nav
      expect(subject).to have_login_link
      expect(subject).to have_signup_link
      expect(subject).not_to have_admin_button
      expect(subject).not_to have_avatar
      expect(subject).not_to have_search
    end
  end
end
