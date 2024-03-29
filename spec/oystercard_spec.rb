require 'oystercard'

describe Oystercard do

  it {is_expected.to be_an_instance_of(Oystercard)}

  # unit test below can be refactored out as later tests implicitly call on this method
  # it {is_expected.to respond_to(:balance)}

  it 'should show an initial balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'should increase the balance by the top_up amount' do
    expect{ subject.top_up 5 }.to change{ subject.balance }.by +5
  end

  it 'should raise an error if maximum balance exceeded' do
    subject.top_up Oystercard::MAX_BALANCE
    expect{ subject.top_up 1 }.to raise_error "Maximum balance #{Oystercard::MAX_BALANCE} exceeded"
  end

  # it {is_expected.to respond_to(:deduct).with(1).argument}
  #
  # it 'should decrease the balance by the deduct amount' do
  #   subject.top_up(5)
  #   expect{ subject.deduct 4 }.to change{ subject.balance }.by -4
  # end

  it 'should raise an error if minimum balance reached' do
    expect{ subject.touch_in }.to raise_error "Minimum balance of £1 required"
  end

  it 'should show user is in journey after touch_in' do
    subject.top_up Oystercard::MIN_BALANCE
    expect { subject.touch_in }.to change { subject.in_journey }.to true
  end

  it 'should show user is not in journey after touch_out' do
    subject.top_up Oystercard::MIN_BALANCE
    subject.touch_in
    expect { subject.touch_out }.to change { subject.in_journey }.to false
  end

  it 'should show money is deducted on touch_out' do
    subject.top_up Oystercard::MIN_BALANCE
    subject.touch_in
    expect { subject.touch_out }.to change { subject.balance }.by -1
  end

end
