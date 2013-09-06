
class Player
  def inverso(dir)
    if dir == :backward
      :forward
    end
    :backward
  end
  def play_turn(warrior)
    if @direcao == nil
      @direcao = :forward
    end
    if warrior.look.enemy?
      warrior.shoot!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel(@direcao).captive?
      warrior.rescue!(@direcao)
    elsif warrior.feel(@direcao).wall?
      #@direcao = :forward
      #warrior.walk!
      warrior.pivot!
    else
      if warrior.health < 20 and !@descansou
        if warrior.health < @health
          warrior.walk!(inverso(@direcao))
        else
          if warrior.health >= 18
            @descansou = true
          end
          warrior.rest!
        end
      else
        warrior.walk!(@direcao)
      end
    end
    @health = warrior.health
  end
end
  