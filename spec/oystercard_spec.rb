require 'oystercard'

describe Oystercard do
  it 'creates an instance of Oystercard' do
    oystercard = Oystercard.new
    expect(oystercard).to be_an_instance_of(Oystercard)
  end

  # it 'responds to balance' do
  #   oystercard = Oystercard.new
  #   expect(oystercard).to respond_to(:balance)
  # end

  it 'should show an initial balance of zero' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end
end
