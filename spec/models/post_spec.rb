require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post)  { FactoryBot.build(:post) }

  it { is_expected.to validate_length_of(:content) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:comments) }

  context 'post is created' do
    subject { post.save }
    it 'is valid when it has more than 5 characters' do
      subject
      expect(post).to be_valid
    end

    it 'is invalid when it has less than 5 characters' do
      post.content = 'a' * 4
      subject
      expect(post).not_to be_valid
      expect(post.errors[:content]).to include('is too short (minimum is 5 characters)')
    end

    it 'is valid when it has 5 characters' do
      post.content = 'a' * 5
      subject
      expect(post).to be_valid
    end
  end
end
