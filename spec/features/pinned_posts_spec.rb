require 'rails_helper'

RSpec.feature "PinnedPosts", type: :feature do
  include_context 'users'

  let(:homepage)            { Home.new }
  let(:admin_panel)         { AdminPage.new }
  let(:pinned_post)         { FactoryBot.build(:pinned_post) }
  let!(:pinned_posts)       { FactoryBot.create_list(:pinned_post, 5, user: admin) }
  let(:last_post_content)   { pinned_posts.last.content }
  let(:fourth_post_content) { pinned_posts[3].content}

  feature 'I want pinned posts' do
    scenario 'to be visible when added less than 24 h ago' do
      create_active_pinned_post
      load_homepage_as_user
      expect(homepage).to have_pinned_posts
    end

    scenario 'not to be visible if added more than 24 h ago' do
      create_expired_pinned_post
      load_homepage_as_user
      expect(homepage).not_to have_pinned_posts
    end

    scenario 'be added by admin' do
      log_in_as admin
      visit '/pinned_posts/new'
      fill_in 'pinned_post_content', with: pinned_post.content
      expect {
        click_button 'Post'
      }.to change(admin.pinned_posts, :count).by(1)
    end

    scenario 'to display only last pinned post' do
      load_homepage_as_user
      expect(homepage).to have_content(last_post_content)
    end

    scenario 'not to display other posts except the most recent' do
      load_homepage_as_user
      expect(homepage).not_to have_content(fourth_post_content)
    end

    scenario 'to display no more than one post' do
      load_homepage_as_user
      expect(homepage.pinned_posts.posts.size).to eq(1)
    end
  end

  private

  def create_active_pinned_post
    PinnedPost.create(
      content: 'abcdefghijk',
      user: user,
      created_at: Time.now - 50
    )
  end

  def create_expired_pinned_post
    PinnedPost.create(
      content: 'abcdefghijk',
      user: user,
      created_at: Time.now - 90_000
    )
  end

  def load_homepage_as_user
    log_in_as user
    homepage.load
  end
end
