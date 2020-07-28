require "spec_helper"

RSpec.describe Deck do
  deck = Deck.new
  it "is made up of cards" do
    expect(deck.cards.all?(Card)).to be_truthy
  end

  describe "#deal" do
    it "takes a number" do
      expect(deck.deal(2))
    end

    it "removes the number of cards" do
      expect(deck.cards.length).to eq(50)
    end
  end
end
