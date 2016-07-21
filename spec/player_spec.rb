require "player"
require "rspec"

describe Player do
  subject(:player) {Player.new(hand)}

  describe "#initialize" do
    it "initializes with a hand of 5 cards" 
  end


end

#at first, I don't want to deal with money.
#I just want the functionality of getting the hand of 5 cards.
#I want to be able to trade in up to 3 cards once.
#As a player, I should start with my personal hand object, and my hand will
#continue to update
