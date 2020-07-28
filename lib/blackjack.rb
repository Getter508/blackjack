require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "game"

puts "\nWelcome to Blackjack!\n"

game = Game.new
game.play
