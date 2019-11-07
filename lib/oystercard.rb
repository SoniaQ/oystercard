class Oystercard

  MAXIMUM_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end
  def top_up(amount)
    # 'balance' does not need to be @balance in below line because the attr_reader
    # allows the specific instance of balance to be called, so @balance doesn't need to be repeated
    fail "Maximum balance #{MAXIMUM_LIMIT} exceeded" if balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end

end
