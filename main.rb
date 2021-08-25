require_relative 'game.rb'
require_relative 'display.rb'
require 'yaml'

currently_playing = true

def play
    
    game = Game.new()

   
    
    
end

while currently_playing == true
    answer = nil
    while answer != "Yes" && answer != "No"
        puts "Would you like to play hang man?"
        puts "Enter 'Yes' or 'No'."
        
        answer = gets.chomp
    end
    if answer == "Yes"
        play
    elsif answer == "No"
        puts "Have a great day!"
        currently_playing = false
    end
end