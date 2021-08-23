

class Game
    attr_reader :letters, :guessed_letters, :incorrect_letters, :blank_spots
    attr_reader :name
    def pick_word
                random_line = nil
        File.open("lib/word_list.txt") do |file|
            file_lines = file.readlines()
            random_line = file_lines[Random.rand(0...file_lines.size())]
        end 

        random_line 
    end
    def initialize(name)
        @name = name
        @word = pick_word
        @display = Display.new
        

    end

    


    def play_hangman()
        
        @letters = @word.split("")
        @guessed_letters = []
        @incorrect_letters = []
        @blank_spots = Array.new(@letters.length, "_")
        @display.update_display
        

        
        



    end

    



end