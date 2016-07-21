require "rspec"
require "hand"

describe Hand do
  let(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do
    it "initializes with an empty array as a hand" do
      expect(hand.cards).to eq([])
    end
  end

  describe "#get_card" do
    it "tells the deck to give one card" do
      deck.shuffle!
      hand.get_card
      expect(hand.cards.length).to eq(1)
      p hand.cards
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

    let(:card1) {double(:card, value: "5", suit: "Heart") }
    let(:card2) {double(:card, value: "5", suit: "Clover") }
    let(:card3) {double(:card, value: "5", suit: "Diamond") }
    let(:card4) {double(:card, value: "5", suit: "Spade") }
    let(:card5) {double(:card, value: "A", suit: "Heart") }


    it "tests for quads" do
      hand.cards=[card1, card2, card3, card4, card5]
      expect(hand.calculate_value).to eq(7)
    end


    let(:card6) {double(:card, value: "5", suit: "Heart") }
    let(:card7) {double(:card, value: "6", suit: "Heart") }
    let(:card8) {double(:card, value: "7", suit: "Heart") }
    let(:card9) {double(:card, value: "8", suit: "Heart") }
    let(:card10) {double(:card, value: "9", suit: "Heart") }

    it "tests for straight flush" do
      hand.cards=[card6, card7, card8, card9, card10]
      expect(hand.calculate_value).to eq(8)
    end


  end

end
