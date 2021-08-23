require_relative 'game.rb'
require_relative 'display.rb'

def play
    puts "Please enter your name."
    name = gets.chomp
    game = Game.new(name)

    game.play_hangman
    
    
end

play