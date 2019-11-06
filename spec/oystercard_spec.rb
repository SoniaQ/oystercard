require 'oystercard'

describe Oystercard do

  it {is_expected.to be_an_instance_of(Oystercard)}

  # unit test below can be refactored out as later tests build on this method
  # it 'should respond to balance' do
  #   oystercard = Oystercard.new
  #   expect(oystercard).to respond_to(:balance)
  # end

  it 'should show an initial balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it {is_expected.to respond_to(top_up).with(1).argument}

end
