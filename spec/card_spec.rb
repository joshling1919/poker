require "card"
require "rspec"

describe Card do

  subject(:card) { Card.new("King", "Hearts") }

  it "initializes with a value" do
    expect(card.value).to eq("King")
  end

  it "initializes with a suit" do
    expect(card.suit).to eq("Hearts")
  end

  describe "#inspect" do
    it "expects inspect to print out value of suit" do
      expect(card.inspect).to eq("King of Hearts")
    end
  end

end
