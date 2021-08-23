require_relative "display.rb"

class Game
    attr_reader :letters, :guessed_letters, :incorrect_letters, :blank_spots
    attr_reader :name
    def pick_word

                random_line = ""
        while random_line.length > 12 || random_line.length < 5 do
            File.open("lib/word_list.txt") do |file|
                file_lines = file.readlines()
                random_line = file_lines[Random.rand(0...file_lines.size())]

            end 
        end
        
        random_line.upcase!
    
    end
    def initialize(name)
        @name = name
        @word = pick_word
        @display = Display.new(@name)
        

    end

    


    def play_hangman()
        @game_over = false
        @display.enter_to_continue
        @letters = @word.split("")
        @guessed_letters = []
        @incorrect_letters = []
        @blank_spots = Array.new(@letters.length, "_")
        @display.explain_hangman
        @guesses_left = 9

        while @game_over == false
            @display.update_display(@guesses_left, @incorrect_letters, @blank_spots)
            

            guess_letter
            @display.enter_to_continue



        end



        
        



        
    

    end

    def guess_letter
        @display.guess_letter_prompt
        player_guess = "a"
        while player_guess.ord > 90 || player_guess.ord < 65
            player_guess = gets.chomp.upcase
            

        end

        
    end

    



end