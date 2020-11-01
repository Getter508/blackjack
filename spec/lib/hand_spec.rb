require "spec_helper"

RSpec.describe Hand do
  hand = Hand.new([Card.new("♦", 2), Card.new("♦", "Q")])
  hand2 = Hand.new([Card.new("♦", 2), Card.new("♦", "Q"), Card.new("♦", "K")])
  hand3 = Hand.new([Card.new("♦", "A"), Card.new("♦", "Q"), Card.new("♦", "K")])
  hand4 = Hand.new([Card.new("♦", "A"), Card.new("♦", 8), Card.new("♦", "K")])

  it "is made up of cards" do
    expect(hand.cards.all?(Card)).to be_truthy
  end

  describe "#determine_score" do
    it "totals the values of the cards accounting for aces" do
      expect(hand4.determine_score).to eq(19)
    end
  end

  describe "#score" do
    it "totals the values of the cards" do
      expect(hand.score).to eq(12)
    end
  end

  describe "#bust?" do
    it "returns true if score > 21" do
      expect(hand.bust?).to be_falsey
    end

    it "returns false if score <= 21" do
      expect(hand2.bust?).to be_truthy
    end
  end

  describe "#contains_high_ace?" do
    it "returns true if hand contains an ace" do
      expect(hand.contains_high_ace?).to be_falsey
    end

    it "returns false if hand does not contain an ace" do
      expect(hand3.contains_high_ace?).to be_truthy
    end
  end
end
