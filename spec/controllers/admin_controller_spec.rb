require 'rails_helper'
require 'shared_examples/controllers'

RSpec.describe AdminController, type: :controller do
  include_context 'users'

  describe '#index' do
    context 'as an authorized user' do
      before do
        sign_in admin
      end

      it_behaves_like 'standard index action'
    end

    context 'as an unauthorized user' do
      it_behaves_like 'index action restricting access'
    end
  end
end
