describe Model do
  let(:model) { FactoryGirl.build(:model) }

  it 'has valid factory' do
    expect(model.save).to be true
  end

  it 'is invalid without name' do
    model.name = nil
    expect(model.save).to be false
  end

  it 'is invalid with blank name' do
    model.name = ''
    expect(model.save).to be false
  end
end
