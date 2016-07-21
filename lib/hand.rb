require_relative "deck"
require "byebug"

class Hand
  COMBINATIONS = {
    straight_flush: 8,
    quads: 7,
    full_house: 6,
    flush: 5,
    straight: 4,
    trips: 3,
    two_pair: 2,
    pair: 1,
    high_card: 0
  }
  attr_reader :deck
  attr_accessor :cards

  def initialize(deck)
    @deck = deck
    @cards = []
  end

  def get_card
    @cards << @deck.take_top_card
  end

  def deal
    5.times { get_card }
  end

  def remove_card(card)
    @cards.delete(card)
  end

  def calculate_value
    histogram = histogram_of_hand
    if histogram.first == 4
      return COMBINATIONS[:quads]
    elsif histogram.first == 3 && histogram[1] == 2
      return COMBINATIONS[:full_house]
    elsif histogram.first == 3
      return COMBINATIONS[:trips]
    elsif histogram.first == 2 && histogram[1] == 2
      return COMBINATIONS[:two_pair]
    elsif histogram.first == 2
      return COMBINATIONS[:pair]
    end

    flush_counter = flush_check

    straight_value = straight?

    if straight_value && flush_counter == 4
      return COMBINATIONS[:straight_flush]
    elsif straight_value
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
      hash_count[card.value] += 1
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
    card_values = []
    @cards.each do |card|
      card_values << card.value.to_i unless %w(J Q K A).include?(card.value)
      if card.value == "A"
        card_values << 14
      elsif card.value == "K"
        card_values << 13
      elsif card.value == "Q"
        card_values << 12
      elsif card.value == "J"
        card_values << 11
      end
    end
    4.times do |index|
      straight = false if card_values[index]+1 != card_values[index+1]
    end
    straight
  end



end
