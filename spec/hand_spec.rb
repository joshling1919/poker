require "rspec"
require "hand"

describe Hand do

  subject(:hand) { Hand.new }

  describe "#initialize" do
    it "initializes with an empty array as a hand" do
      expect(hand.cards).to eq([])
    end
  end

  let(:deck) { double(:deck, :deal_card)}
  describe "#get_card" do
    it "tells the deck to give one card" do
      expect(deck).to receive(deal_card).with(hand)
    end
  end

  describe "deal" do
    it "gets five cards" do
      hand.deal
      expect(hand.cards.length).to eq(5)
    end
  end

  describe "remove_card(card)" do
    let(:card) { double(:card)}
    it "removes the specific card from hand" do
      hand.deal
      hand.remove_card(card)
      expect(hand.cards).not_to include(card)
    end
  end



#  [KH, QS, 3D, 3C, 8D]

  describe "calculate_value" do

    it "tests for 4 of a kind" do

    end
    it "tests for full house" do

      
    end


  end

end
