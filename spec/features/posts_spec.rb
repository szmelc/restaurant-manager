require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  include_context    'users'

  let!(:post)        { FactoryBot.create(:post) }
  let(:comment)      { FactoryBot.build(:comment, post_id: post.id, user_id: user.id) }
  let(:homepage)     { Home.new }

  feature 'I want posts to' do
    before do
      log_in_as user
      homepage.load
    end

    scenario 'display comments' do
      comment.save
      click_link 'Comment'
      expect(page).to have_content(post.content)
      expect(page).to have_content(comment.content)
    end

    scenario 'be commentable' do
      expect(homepage.posts).to have_comment_link
      homepage.posts.comment_link.click
      fill_in 'comment_content', with: 'come to brazil'
      expect_posting_to_increase_comments_count
      expect_comments_counter_to_display_number
      expect(user.comments.count).to eq(1)
    end

    scenario 'be displayed on homepage' do
      expect(homepage.posts).to have_post
    end

    scenario 'to display avatar and content' do
      expect(homepage.posts.post).to have_avatar
      expect(homepage.posts.post).to have_content
    end
  end

  private

  def expect_posting_to_increase_comments_count
    expect {
      click_button 'Post'
    }.to change(post.comments, :count).by(1)
  end

  def expect_comments_counter_to_display_number
    expect(homepage.posts).to have_content('Comments: 1')
  end
end
