require_relative "deck"

class Hand
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  COMBINATIONS = {
    straight_flush: 8
    four_of_a_kind: 7,
    full_house: 6,
    flush: 5,
    straight: 4,
    three_of_a_kind: 3,
    two_pair: 2,
    pair: 1,
    high_card: 0
  }

  attr_accessor :cards

  def initialize
    @cards = []
  end

  def calculate_value
    histogram = histogram_of_hand

    if histogram.first == 4
      return COMBINATIONS[:four_of_a_kind]
    elsif histogram.first == 3 && histogram[1] == 2
      return COMBINATIONS[:full_house]
    elsif histogram.first == 3
      return COMBINATIONS[:three_of_a_kind]
    elsif histogram.first == 2 && histogram[1] == 2
      return COMBINATIONS[:two_pair]
    elsif histogram.first == 2
      return COMBINATIONS[:pair]
    end

    flush_counter = flush_check

    straight_value = straight?

    if straight && flush_counter == 4
      return COMBINATIONS[:straight_flush]
    elsif straight
      return COMBINATIONS[:straight]
    elsif flush_counter == 4
      return COMBINATIONS[:flush]
    else
      return COMBINATIONS[:high_card]
    end

  end


  def histogram_of_hand
    hash_count = Hash.new(0)
    @cards.each do |card|
      hash_count[card] += 1
    end
    hash_count.values.sort.reverse
  end

  def flush_check
    flush_counter = 0
    4.times do |index|
      flush_counter += 1 if @cards[index].suit == @cards[index + 1].suit
    end
    flush_counter
  end

  def straight?
    straight = true
    card_values = @cards.map{ |card| card.value }
    array_of_values = []
    VALUES.each_with_index do |value, index|
      array_of_values << index if card_values.include?(value)
    end

    4.times do |index|
      straight = false if array_of_values[index]+1 != array_of_values[index+1]
    end
    straight
  end

end
