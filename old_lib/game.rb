class Game
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Hand.new(deck.deal(2))
    @dealer = Hand.new(deck.deal(2))
  end

  def play
    player_summary
    player_turn
    unless player.bust?
      dealer_summary
      dealer_turn
      unless dealer.bust?
        winner
      end
    end
  end

  def player_summary
    player.cards.each do |card|
      puts "Player was dealt #{card.rank}#{card.suit}"
    end
    puts "Player score: #{player.calculate_hand}"
  end

  def player_turn
    input = nil
    until input == "S" || player.bust?

      if input != "H" || input != "S"
        puts "Not a valid choice." unless input == nil
        input = prompt
      end

      while input == "H"
        hit
        player.bust? ? input = nil : input = prompt
      end

      stand if input == "S"
    end
  end

  def prompt
    print "\nHit or stand (H/S):"
    gets.chomp.upcase
  end

  def hit
    player.cards += deck.deal(1)
    puts "\nPlayer was dealt #{player.cards.last.rank}#{player.cards.last.suit}\n" \
      "Player score: #{player.calculate_hand}\n"
    if player.bust?
      puts "\nBust! Game over."
    end
  end

  def stand
    puts "\nPlayer score: #{player.calculate_hand}\n\n"
  end

  def dealer_summary
    dealer.cards.each do |card|
      puts "Dealer was dealt #{card.rank}#{card.suit}"
    end
    puts "Dealer score: #{dealer.calculate_hand}"
  end

  def dealer_turn
    while dealer.calculate_hand < 17
      dealer.cards += deck.deal(1)
      puts "\nDealer was dealt #{dealer.cards.last.rank}#{dealer.cards.last.suit}\n" \
        "Dealer score: #{dealer.calculate_hand}"
    end
    puts dealer_outcome
  end

  def dealer_outcome
    dealer.bust? ? "\nDealer Busts. You win!" : "\nDealer stands."
  end

  def winner
    if player.calculate_hand == dealer.calculate_hand
      puts "\nTie!"
    elsif player.calculate_hand > dealer.calculate_hand
      puts "\nYou win!"
    else
      puts "\nDealer wins!"
    end
  end
end
