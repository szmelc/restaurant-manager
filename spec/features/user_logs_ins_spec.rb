require 'rails_helper'

RSpec.feature "UserLogsIns", type: :feature do
  include_context 'users'
  let(:home_page) { Home.new }

  feature 'user logs in' do
    before do
      log_in_as user
    end

    scenario 'and sees welcome message' do
      expect(home_page).to have_content(I18n.t('devise.sessions.signed_in'))
    end

    scenario 'and sees proper user home page layout' do
      expect(home_page).to have_menu
      expect(home_page.menu).not_to have_admin_button
      expect(home_page).to have_post_form
    end

    scenario 'and adds a post' do
      add_post('Hej sportowe świry!', user)
    end

    scenario 'cannot add a post that is too short' do
      add_too_short_post('abc', user)
    end

    scenario 'and cannot see admin panel button' do
      expect(home_page.menu).not_to have_admin_button
    end

    context 'looks at pinned posts' do
      let(:admin)           { FactoryBot.create(:user, :admin) }

      context 'last pinned post has expired' do
        let!(:pinned_post)  { FactoryBot.create(:pinned_post, :expired, user: admin) }

        scenario 'and cannot see pinned post' do
          expect(home_page).not_to have_pinned_posts
        end
      end

      # context 'last pinned post is still active' do
      #   let!(:pinned_post)  { FactoryBot.create(:pinned_post, user: admin) }

      #   scenario 'and can see pinned post' do
      #     expect(home_page).to have_pinned_posts
      #   end
      # end
    end
  end

  feature 'admin logs in' do
    before do
      log_in_as admin
    end

    scenario 'and sees welcome message' do
      expect(home_page).to have_content(I18n.t('devise.sessions.signed_in'))
    end

    scenario 'and sees proper admin home page layout' do
      expect(home_page).to have_menu
      expect(home_page.menu).to have_admin_button
      expect(home_page).to have_footer
      expect(home_page).to have_post_form
    end

    scenario 'and adds post' do
      add_post('Hej sportowe świry!', admin)
    end

    scenario 'and cannot add a post that is too short' do
      add_too_short_post('abc', admin)
    end
  end

  feature 'user adds post' do
    scenario 'content is too short' do
    end

    scenario 'content is all right' do
    end
  end

  private

  def add_post(content, owner)
      home_page.load
      home_page.post_form.post_input.set(content)
      expect {
        home_page.post_form.post_button.click
      }.to change(owner.posts, :count).by(1)
  end

  def add_too_short_post(content, owner)
      home_page.load
      home_page.post_form.post_input.set(content)
      expect {
        home_page.post_form.post_button.click
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
