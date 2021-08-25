module FileManip


    def save_game
        Dir.mkdir 'saved_games' unless Dir.exist? 'saved_games'
        @filename = "#{random_name}_game.yaml"

        File.open("saved_games/#{@filename}", 'w') do |file| 
            file.write save_in_yaml
        end
        puts "The game has been saved and is named '#{@filename}'.s"


        
        
    end



    #makes a combo of two words and a 3 digit number to make a random name
    def random_name
        random_file_name = ""
        colors = ['Blue', 'Red', 'Green', 'Yellow', 
            'Purple', 'Black', 'Orange', 'Brown']
        animals = ['Bear', 'Duck', 'Dog', 'Goose', 'Cow', 'Raccoon', 'Hippo']

        random_file_name = colors[rand(0..7)] + '_' + animals[rand(0..6)]
        3.times do
            random_file_name += "#{rand(0..9)}"
        end
        
        random_file_name
    end



    def save_in_yaml

        YAML.dump(
            'word' => @word,
            'letters' => @letters,
            'guesses_left' => @guesses_left,
            'guessed_letters' => @guessed_letters,
            'blank_spots' => @blank_spots,
            'name' => @name,
        )
    end

    def load_game 
       n = pick_game_save
        # @letters =
        # @word = 
        # @guesses_left =
        # @guessed_letters = 
        # @blank_spots =
        # @name =

    end

    def pick_game_save
        choice = false
        while choice == false
            puts "Please select a file below"
            show_saved_games
            puts "Please enter the corresponding number to play the saved game."
            puts "If you'd like to exit and play a new game, enter 'Exit' . "
            answer = gets.chomp
             
            if answer == 'Exit'
                choice = true
                return 'Exit'
            elsif [1..999].include?(answer.to_int)
                choice = true
            else
                
            end
        end
    end

    def show_saved_games
        

        

    end

end




