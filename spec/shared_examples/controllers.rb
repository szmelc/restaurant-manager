shared_examples_for('standard index action') do
  it 'returns 200' do
    expect(response).to have_http_status(200)
  end

  it 'response is a success' do
    expect(response).to be_success
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

  it 'returns 200' do
    expect(response).to have_http_status(200)
  end

  it 'response is successful' do
    expect(response).to be_success
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
