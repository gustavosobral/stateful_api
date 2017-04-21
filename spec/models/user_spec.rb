describe User do
  let(:user) { FactoryGirl.build(:user) }

  it 'has valid factory' do
    expect(user.save).to be true
  end
end
