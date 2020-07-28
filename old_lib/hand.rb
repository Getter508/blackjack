class Hand
  FACECARDS = ["J", "Q", "K"]

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    hand_total = 0
    cards.each do |card|
      if card.rank == "A"
        hand_total += 11
      elsif FACECARDS.any? { |facecard| facecard == card.rank }
        hand_total += 10
      else
        hand_total += card.rank
      end
    end

    if cards.any? { |card| card.rank == "A" } && hand_total > 21
      hand_total -= 10
    end
    hand_total
  end

  def bust?
    calculate_hand > 21
  end
end
