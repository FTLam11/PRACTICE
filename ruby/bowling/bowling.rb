class Game
    def initialize
        @score = 0
        @game_state = Array.new(1) { Array.new }
    end

    def roll(knocked_down_pins) 
        @game_state << Array.new if new_frame?
        @game_state.last.push(knocked_down_pins)
    end

    def score
        # score all pins
        @score = @game_state.flatten.inject(:+)
        # score strikes
        @game_state.flatten.each_with_index do | throw, index |
            if (throw == 10 && index == 0) || (throw == 10 && @game_state.flatten[index -1] != 0)
                @score += @game_state.flatten[index + 1].to_i
                @score += @game_state.flatten[index + 2].to_i
            end
        end
        # score spares
        @game_state.each_with_index do | frame, index |
            if frame.length == 2 && frame.inject(:+) == 10
                @score += @game_state[index + 1][0]
            end
        end

        if @game_state.last

        @score
    end

    def new_frame?
        return false if @game_state.length == 10
        return true if @game_state.last.first == 10
        return true if @game_state.last.length == 2 && (!@game_state.last.include? nil)
        false
    end
end