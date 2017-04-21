describe User do
  let(:user)  { FactoryGirl.build(:user) }
  let(:admin) { FactoryGirl.build(:admin) }

  it 'has valid user factory' do
    expect(user.save).to be true
  end

  it 'has an admin factory' do
    expect(admin.save).to be true
    expect(admin.admin?).to be true
  end

  it 'admin flag default to false' do
    user = FactoryGirl.create(:user)
    expect(user.admin?).to be false
  end
end
