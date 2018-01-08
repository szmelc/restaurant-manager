RSpec.shared_context 'users' do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:user)  { FactoryBot.create(:user, admin: false) }
end

RSpec.configure do |rspec|
  rspec.include_context "users", :include_shared => true
end
