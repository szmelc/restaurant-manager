require 'rails_helper'

RSpec.feature "LogIn", type: :feature do
  include_context 'users'
  let(:homepage) { Home.new }

  feature 'I want user to log in' do
    before do
      log_in_as user
    end

    scenario 'and see welcome message' do
      expect(homepage).to have_content(I18n.t('devise.sessions.signed_in'))
    end

    scenario 'and see proper user home page layout' do
      expect(homepage).to have_menu
      expect(homepage.menu).not_to have_admin_button
      expect(homepage).to have_post_form
    end

    scenario 'and be able to add a post' do
      add_post('Hej sportowe świry!', user)
    end

    scenario 'not be able to add a post that is too short' do
      add_too_short_post('abc', user)
    end

    scenario 'and not be able to see admin panel button' do
      expect(homepage.menu).not_to have_admin_button
    end
  end

  feature 'I want admin to log in' do
    before do
      log_in_as admin
    end

    scenario 'and see welcome message' do
      expect(homepage).to have_content(I18n.t('devise.sessions.signed_in'))
    end

    scenario 'and see proper admin home page layout' do
      expect(homepage).to have_menu
      expect(homepage.menu).to have_admin_button
      expect(homepage).to have_footer
      expect(homepage).to have_post_form
    end

    scenario 'and be able to add a post' do
      add_post('Hej sportowe świry!', admin)
    end

    scenario 'and not be able to add a post that is too short' do
      add_too_short_post('abc', admin)
    end
  end

  private

  def add_post(content, owner)
      homepage.load
      homepage.post_form.post_input.set(content)
      expect {
        homepage.post_form.post_button.click
      }.to change(owner.posts, :count).by(1)
  end

  def add_too_short_post(content, owner)
      homepage.load
      homepage.post_form.post_input.set(content)
      expect {
        homepage.post_form.post_button.click
      }.not_to change(owner.posts, :count)
  end

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
