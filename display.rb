class Display

    def initialize(name)
        @name = name

    end
    #basically a pause for instructions and parts that the player should wait to
    #read through
    def enter_to_continue
        puts "\n"
        puts "\t\t--------Press Enter to Continue------"
        continue = gets
    end

    
    def show_blank_spots(blanks)
        blanks.each do |tile|
            print " #{tile}"
        end
        puts "\n\n"
    end

    def guess_letter_prompt
        print "Choose a letter wisely:"
        
    end

    def explain_hangman
        puts "\t\tThis game you're about to play is called Hangman. I, the computer,
         will pick a word for you to guess. The length of the word will be 
        indicated by the number of empty spaces presented before you. Six empty 
        spaces means the word is six letters long. Each time that I prompt you,
        you will give me a letter. Each time that a letter you guess is in the
        word I've chosen, I'll reveal the spot or spots that letter goes in 
        among the empty spaces of the word. Each time you give me an incorrect 
        letter, a body part will be added to the 'hangman'. In this version this
        will be demonstrated by the number of body parts you have left. You 
        start off with 9 and when you hit 0 it's game over."

        enter_to_continue
        
    end


    def update_display(guesses_remaining, incorrect_letters, blanks)
        puts "Incorrect Letters: "
        incorrect_letters.each do |letter|
            print " #{letter}"
        puts "Body Parts Remaining: #{guesses_remaining}"
        puts "\n"
        puts "\t\t"
        blanks.each do |tile|
            print " #{tile}"
        end
        puts "\n\n"


        


    end


end