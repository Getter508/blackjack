class Hand
  def initialize(cards)
    @cards = cards
    @score = score
  end

  attr_accessor :cards

  def determine_score
    if contains_high_ace? && bust?
      cards.detect { |card| card.rank == "A" && card.value == 11 }.update_ace_value
    end
    score
  end

  def score
    cards.sum { |card| card.value }
  end

  def bust?
    score > 21
  end

  def contains_high_ace?
    cards.any? { |card| card.rank == "A" && card.value == 11 }
  end
end
