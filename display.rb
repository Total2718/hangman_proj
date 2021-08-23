class Display

    def initialize(name)
        @name = name

    end
    #basically a pause for instructions and parts that the player should wait to
    #read through
    def enter_to_continue
        puts "--------Press Enter to Continue------"
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
        puts "This game you're about to play is called Hangman. I, the computer,
         will pick a word for you to guess. The length of the word will be 
        indicated by the number of empty spaces presented before you. Six empty 
        spaces means the word is six letters long. Each time that I prompt you,
        you will give me a letter. "
        
    end




end