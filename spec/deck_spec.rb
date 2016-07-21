require "deck"
require "rspec"

describe Deck do

  subject(:test_deck) { Deck.new }

  SUITS = %w(Heart Diamond Spade Clover)
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  describe "#initialize" do
    it "populates instance variable @deck with 52 things" do
      expect(test_deck.all_cards.length).to eq(52)
    end

    it "populates with 52 card objects" do
      test_deck.all_cards.each do |el|
        expect(el.class).to eq(Card)
      end
    end

    it "populates with the correct values" do
      SUITS.each do |suit|
        VALUES.each do |value|
          uniqueness_test = test_deck.all_cards.any? do |card|
            card.value == value && card.suit == suit
          end
          expect(uniqueness_test).to be true
        end
      end
    end


  end


  describe "#shuffle!" do
    let(:deck_copy){ test_deck.dup }
    it "shuffles the deck" do
      expect(deck_copy).not_to eq(test_deck.shuffle!)
    end

  end

  describe 'take_top_card' do

    it "takes out the first card" do
      current_first = test_deck.all_cards.first
      expect(test_deck.take_top_card).to be(current_first)
      expect(test_deck.all_cards).not_to include(current_first)
    end


  end



end
