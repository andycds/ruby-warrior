
class Player
  def inverse(direction)
    if (direction == :backward)
      return :forward
    end
    :backward
  end

  def play_turn(warrior)
    if @health == nil
      @health = warrior.health
    end

    if (@back == nil)
      @direction = :backward
    else
      @direction = :forward
    end

    if (warrior.feel(@direction).captive?)
      warrior.rescue!(@direction)
    elsif (warrior.feel(@direction).enemy?)
      warrior.attack!(@direction)
    elsif (warrior.feel(@direction).wall?)
      @back = true
    else
      if (warrior.health < @health)
        warrior.walk!(inverse(@direction))
      elsif (warrior.health < 20)
        warrior.rest!
      else
        warrior.walk!(@direction)
      end
    end
    @health = warrior.health
  end
end
