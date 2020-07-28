class Card
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = set_value
  end

  attr_reader :suit, :rank
  attr_accessor :value

  def set_value
    if rank == "A"
      value = 11
    elsif Deck::FACE_CARDS.include?(rank)
      value = 10
    else
      value = rank
    end
  end

  def update_ace_value
    @value = 1
  end
end
