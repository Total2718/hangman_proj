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
            'incorrect_letters' => @incorrect_letters
        )
    end

    def load_game 
       n = pick_game_save
        
        if n == 'Exit'
            return 'Exit'
        else
             @letters = n['letters']
             @word = n['word']
             @guesses_left = n['guesses_left']
             @guessed_letters = n['guessed_letters']
             @blank_spots = n['blank_spots']
             @name = n['name']
             @incorrect_letters = n['incorrect_letters']

        end
    end

    def pick_game_save
        choice = false
        answer = ''
        while choice == false
            puts "Please select a file below"
            show_saved_games
            puts "Please enter the corresponding number to play the saved game."
            puts "If you'd like to exit and play a new game, enter 'Exit' instead. "
            answer = gets.chomp
             
            if answer == 'Exit'
                choice = true
                return 'Exit'
            elsif (1..999).include?(answer.to_i) && answer.to_i <= Dir.entries("./saved_games").length - 2
                answer = answer.to_i 
                choice = true
                return load_file(answer)
            end
        end
        
        
        
    end

    def show_saved_games
        puts "\n"
        n = 0
        saved_games = Dir.each_child('./saved_games') do |save_name|
            n += 1
            puts "#{n}) #{save_name}"
        end
        puts "\n"
    end

    def load_file(file_number)
        list_of_saves = Dir.entries("./saved_games")
        list_of_saves.delete_if { |element| element == "." || element == ".."}
        puts list_of_saves
        filename = "./saved_games/#{list_of_saves[file_number - 1]}"
        file = File.open(filename, 'r')
         hash = YAML.load(File.read(filename))
         File.delete(filename)
        return hash

        

    end

end




