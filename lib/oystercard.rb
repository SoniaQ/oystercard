class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    # 'balance' does not need to be @balance in below line because the attr_reader
    # allows the specific instance of balance to be called, so @balance doesn't need to be repeated
    fail "Maximum balance #{MAX_BALANCE} exceeded" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    fail "Minimum balance of £1 required" if balance - amount < MIN_BALANCE
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
