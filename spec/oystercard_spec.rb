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

  it {is_expected.to respond_to(:top_up).with(1).argument}

  it 'should increase the balance by the top_up amount' do
    expect{subject.top_up(5)}.to change{subject.balance}.from(0).to(5)
  end
end
