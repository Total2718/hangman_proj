class Display

    #basically a pause for instructions and parts that the player should wait to
    #read through
    def enter_to_continue
        puts "--------Press Enter to Continue------"
    end

    def update_display()
        puts game.blank_spots
    end




end