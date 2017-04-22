describe State do
  let(:state) { FactoryGirl.build(:state) }

  it 'has a valid factory' do
    expect(state.save).to be true
  end

  it 'is invalid without model' do
    state.model = nil
    expect(state.save).to be false
  end

  it 'is invalid without name' do
    state.name = nil
    expect(state.save).to be false
  end

  it 'is invalid without order' do
    state.order = nil
    expect(state.save).to be false
  end
end
