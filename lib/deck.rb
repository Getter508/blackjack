class Deck
  FACE_CARDS = ["J", "Q", "K"].freeze
  SUITS = ["♦", "♣", "♠", "♥"].freeze
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"].freeze

  def initialize
    @cards = build_deck
  end

  attr_reader :cards

  def build_deck
    cards = SUITS.flat_map do |suit|
      RANKS.map { |rank| Card.new(suit, rank) }
    end
    cards.shuffle!
  end

  def deal(n)
    cards.shift(n)
  end
end
