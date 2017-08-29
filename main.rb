require './board.rb'
require './player.rb'
require './game.rb'

def get_name(player)
  puts "Hi player #{player}! What is your name?"
  name = gets.chomp
  name
end

puts "Tic Tac Toe"
puts "Ready to play? (yes or no)"
answer = gets.chomp.downcase
if answer == "yes"
  game = Game.new(get_name(1), get_name(2))
else
  puts "Goodbye!"
  exit
end
game.begin_game
