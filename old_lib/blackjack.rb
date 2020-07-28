require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'game'

puts "Welcome to BlackJack!"
puts

game = Game.new
game.play
