require "spec_helper"

RSpec.describe Card do
  card1 = Card.new("♦", 2)
  card2 = Card.new("♦", "Q")
  card3 = Card.new("♦", "A")

  it "takes a suit and a rank" do
    expect(card1).to be_a(Card)
    expect(card1.suit).to eq("♦")
    expect(card1.rank).to eq(2)
  end

  describe "#set_value" do
    it "has a value" do
      expect(card1.value).to eq(2)
      expect(card2.value).to eq(10)
      expect(card3.value).to eq(11)
    end
  end

  describe "#update_ace_value" do
    it "updates ace value to 1" do
      card3.update_ace_value
      expect(card3.value).to eq(1)
    end
  end
end
