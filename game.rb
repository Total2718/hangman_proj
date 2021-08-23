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
        @word = pick_word.chomp
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
            
            guess_chosen = false
            player_guess = "g"
            while guess_chosen == false           
                player_guess = guess_letter
                

                @display.enter_to_continue
                if @guessed_letters.include?(player_guess) == true
                    puts "Sorry, you've already chosen that letter."
                    
                else
                    guess_chosen = true
                    @guessed_letters.append(player_guess)


                end
            end

            check_guess(player_guess)

            check_game_over
            puts "\n"


        end



        
        



        
    

    end

    def guess_letter
        
        player_guess = "aa"
        while player_guess.ord > 90 || player_guess.ord < 65
                
                @display.guess_letter_prompt
                player_guess = gets.chomp
                if player_guess.empty? == true
                    player_guess = "aa"
                    next
                end
           
            
            if player_guess.ord > 96 && player_guess.ord < 123
                player_guess.upcase!
            end
            
            
           if player_guess.length != 1
            player_guess = "aa"
           end
           
           

        end

        player_guess

    end

    def check_guess(player_guess)
        if @letters.include?(player_guess) == true

            puts "Nice guess."
            @letters.each_with_index do |letter, index|
                if letter == player_guess
                    @blank_spots[index] = player_guess
                end
            end

        else
            puts "Oops. That letter isn't in the word.\n"
            @guesses_left -= 1
            @incorrect_letters.append(player_guess)

        end

    end

    def check_game_over
        if @blank_spots.include?("_") == false
            @display.update_display(@guesses_left, @incorrect_letters, @blank_spots)
            @display.win
            @game_over = true
        elsif @guesses_left == 0
            @display.lose(@word)
            @game_over = true

        end
    end

    



end