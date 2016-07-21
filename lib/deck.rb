require_relative "card"

class Deck

  SUITS = %w(Heart Diamond Spade Clover)
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  attr_reader :all_cards

  def initialize
    @all_cards = []
    SUITS.each do |suit|
      VALUES.each {|value| @all_cards << Card.new(value, suit) }
    end
  end

  def shuffle!
    @all_cards.shuffle!
  end

  def deal_card(hand)
    hand.cards << @all_cards.shift
    nil
  end

  def count
    @all_cards.length
  end

end
