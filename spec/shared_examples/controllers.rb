shared_examples_for('standard index action') do

  it 'response is a success and 200' do
    expect(response).to be_success and have_http_status(200)
  end
end

shared_examples_for('index action restricting access') do
  before do
    sign_in user
  end

  it 'restricts access to the page' do
    expect { get :index }.to raise_error(CanCan::AccessDenied)
  end
end

shared_examples_for('standard new action') do
  before do
    get :new
  end

  it 'response is successful 200' do
    expect(response).to be_success and have_http_status(200)
  end
end

shared_examples('new action restricting access') do
  before do
    sign_in user
  end

  it 'restricts access' do
    expect{ get :new }.to raise_error(CanCan::AccessDenied)
  end
end
