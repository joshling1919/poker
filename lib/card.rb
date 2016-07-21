class Card

  attr_reader :suit, :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def inspect
    "#{@value} of #{@suit}"
  end

end
