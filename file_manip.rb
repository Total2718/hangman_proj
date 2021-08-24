module FileManip


    def save_game
        Dir.mkdir 'saved_games' unless Dir.exist? 'saved_games'
        @filename = "#{random_name}_game.yaml"

        File.open("saved_games/#{@filename}", 'w') do |file| 
            file.write save_in_yaml
        end


        
        
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
            'word' => @word
            'letters' => @letters
            'guesses_left' => @guesses_left
            'guessed_letters' => @guessed_letters
            'blank_spots' => @blank_spots
            'name' => @name
        )


    end

end


FileManip.save_game

