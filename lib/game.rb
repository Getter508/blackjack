class Game
  VALID_CHOICES = ["H", "S"].freeze
  DEALER_MIN = 17
  DEALER_STR = "Dealer".freeze
  PLAYER_STR = "Player".freeze

  def initialize
    @deck = Deck.new
    @player = Hand.new(deck.deal(2))
    @dealer = Hand.new(deck.deal(2))
  end

  attr_reader :deck, :player, :dealer

  def play
    display_initial_summary
    player_turn
    unless player.bust?
      dealer_turn
      determine_winner unless dealer.bust?
    end
  end

  def display_initial_summary
    initial_hand(player, PLAYER_STR)
    puts "\n#{DEALER_STR}'s card: #{dealer.cards.last.rank}#{dealer.cards.last.suit}"
  end

  #make this usable for both player and dealer?
  def initial_hand(hand,name)
    puts
    hand.cards.each do |card|
      puts "#{name} was dealt #{card.rank}#{card.suit}"
    end
    puts "#{name}'s score: #{hand.determine_score}\n"
  end

  def player_turn
    input = nil
    until input == "S" || player.bust?
      if VALID_CHOICES.none?(input)
        puts "Not a valid choice." unless input == nil
        input = prompt
      end

      while input == "H"
        hit(player, PLAYER_STR)
        if player.bust?
          input = nil
          puts "\nBust! Game over."
        else
          input = prompt
        end
      end

      display_score(player,PLAYER_STR) if input == "S"
    end
  end

  def prompt
    print "\nHit or Stand (H/S): "
    gets.chomp.upcase
  end

  def hit(hand, name)
    hand.cards += deck.deal(1)
    puts "\n#{name} was dealt #{hand.cards.last.rank}#{hand.cards.last.suit}"
    display_score(hand,name)
  end

  def display_score(hand,name)
    puts "#{name}'s score: #{hand.determine_score}"
  end

  def dealer_turn
    initial_hand(dealer, DEALER_STR)
    until dealer.determine_score >= DEALER_MIN
      hit(dealer, DEALER_STR)
    end
    puts dealer_outcome
  end

  def dealer_outcome
    dealer.bust? ? "\n#{DEALER_STR} Busts. You win!" : "\n#{DEALER_STR} stands.\n\n"
  end

  def determine_winner
    display_score(player, PLAYER_STR)
    display_score(dealer, DEALER_STR)

    if player.determine_score > dealer.determine_score
      puts "\n#{PLAYER_STR} wins!"
    elsif player.determine_score < dealer.determine_score
      puts "\n#{DEALER_STR} wins!"
    else
      puts "\nTie!"
    end
  end
end
