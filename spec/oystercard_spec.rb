require 'oystercard'

describe Oystercard do

  it {is_expected.to be_an_instance_of(Oystercard)}

  # unit test below can be refactored out as later tests implicitly call on this method
  # it {is_expected.to respond_to(:balance)}

  it 'should show an initial balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it {is_expected.to respond_to(:top_up).with(1).argument}

  it 'should increase the balance by the top_up amount' do
    expect{subject.top_up 5}.to change{subject.balance}.by +5
  end

  it 'should raise an error if maximum balance exceeded' do
    subject.top_up Oystercard::MAXIMUM_LIMIT
    expect{subject.top_up 1}.to raise_error "Maximum balance #{Oystercard::MAXIMUM_LIMIT} exceeded"
  end

  it {is_expected.to respond_to(:deduct).with(1).argument}

  it 'should decrease the balance by the deduct amount' do
    subject.top_up(5)
    expect{subject.deduct 4}.to change{subject.balance}.by -4
  end
    # the longer notation for the above unit test would be:
  # it 'should decrease the balance by the deduct amount' do
  #   subject.top_up(5)
  #   subject.deduct(4)
  #   expect{subject.deduct}.to eq 1
  # end
end
