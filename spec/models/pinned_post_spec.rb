require 'rails_helper'

RSpec.describe PinnedPost, type: :model do
  let(:user)  { FactoryBot.create(:user) }
  let(:pinned_post) { FactoryBot.build(:pinned_post, user: user) }

  it { is_expected.to validate_length_of(:content) }
  it { is_expected.to belong_to(:user) }

  context 'pinned post is created' do

    it 'is valid when it has between 5 and 200 characters' do
      pinned_post.save
      expect(pinned_post).to be_valid
    end

    it 'is invalid when it it has less than 5 characters' do
      pinned_post.content = 'abcd'
      pinned_post.save
      expect(pinned_post.errors[:content]).to include('is too short (minimum is 5 characters)')
      expect(pinned_post).not_to be_valid
    end

    it 'is invalid when it it has more than 200 characters' do
      pinned_post.content = 'abcd' * 51
      pinned_post.save
      expect(pinned_post.errors[:content]).to include('is too long (maximum is 200 characters)')
      expect(pinned_post).not_to be_valid
    end

    it 'is valid when it has 5 characters' do
      pinned_post.content = 'abcde'
      pinned_post.save
      expect(pinned_post).to be_valid
    end

    it 'is valid when it has 200 characters' do
      pinned_post.content = 'abcde' * 40
      pinned_post.save
      expect(pinned_post).to be_valid
    end

    it 'increases user post count when saved' do
      expect{ pinned_post.save }.to change(user.pinned_posts, :count).by(1)
    end
  end
end
