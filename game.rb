require_relative "display.rb"
require 'yaml'
require_relative 'file_manip.rb'

class Game
include FileManip
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
    def initialize()
        new_game = load_or_new_game
        if new_game == true
            puts "Please enter your name."
        name = gets.chomp
        
            @name
            @word = pick_word.chomp
            @display = Display.new(@name)
            @letters = @word.split("")
            @guesses_left = 9
            @guessed_letters = []
            @incorrect_letters = []
            @blank_spots = Array.new(@letters.length, "_")
            @display.explain_hangman
            play_hangman
        elsif new_game == false
             if Dir.empty?('./saved_games') == true
                puts "Sorry, there are no games saved."
             else
               load_choice = load_game
               if load_choice != 'Exit'
                play_hangman
               end
                
             end
            

        
           



        end

    end

    


    def play_hangman()
        @game_over = false
        
        
        
        while @game_over == false
            
            @display.update_display(@guesses_left, @incorrect_letters, @blank_spots)
            
            guess_chosen = false
            player_guess = "g"
            while guess_chosen == false           
                player_guess = guess_letter
                break if player_guess == 'save'

                @display.enter_to_continue
                if @guessed_letters.include?(player_guess) == true
                    puts "Sorry, you've already chosen that letter."
                    
                else
                    guess_chosen = true
                    @guessed_letters.append(player_guess)


                end
            end
            break if player_guess == 'save'
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
            if player_guess == 'save'
                save_game
                break
            else
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

    def load_or_new_game()
        puts "Would you like to play a new game or load a saved game?"
        puts ("1) New game")
        puts ("2) Load saved game")
       
        choice_valid = false
        choice = ''
        game = ''
        while choice_valid == false
            puts "Please enter '1' or '2'."
            choice = gets.chomp
            if ["1", "2"].include?(choice)
                choice_valid = true
            end
        end
        if choice == '1'
            true
        elsif choice == '2'
            false
        end
    end



end