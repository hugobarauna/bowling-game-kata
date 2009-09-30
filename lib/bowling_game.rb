class BowlingGame
  def initialize
    @rolls = []
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    @score = 0
    frame_index = 0

    10.times do
      if is_strike?(frame_index)
        @score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif is_spare?(frame_index)
        @score += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        @score += sum_of_balls_in_frame(frame_index)
        frame_index += 2
      end
    end

    @score
  end

  private
    def sum_of_balls_in_frame(frame_index)
      @rolls[frame_index].to_i + @rolls[frame_index+1].to_i
    end

    def is_spare?(frame_index)
      (@rolls[frame_index].to_i + @rolls[frame_index+1].to_i) == 10
    end

    def is_strike?(frame_index)
      @rolls[frame_index].to_i == 10
    end

    def strike_bonus(frame_index)
      @rolls[frame_index+1].to_i + @rolls[frame_index+2].to_i
    end

    def spare_bonus(frame_index)
      @rolls[frame_index+2].to_i
    end
end











