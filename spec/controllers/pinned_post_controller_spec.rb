require 'rails_helper'
require 'shared_examples/controllers'

RSpec.describe PinnedPostsController, type: :controller do
  include_context 'users'

  describe '#new' do
    context 'as admin' do
      before do
        sign_in admin
      end

      it_behaves_like 'standard new action'
    end

    context 'as unauthorized user' do
      it_behaves_like 'new action restricting access'
    end
  end
end
