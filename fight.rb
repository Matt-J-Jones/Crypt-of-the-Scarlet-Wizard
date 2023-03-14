def fight(player, monster)
  while true
    if player[:Health] > 0 && monster[:Health] > 0
      monster[:Health] -= damage_calc(player[:Strength], player[:Luck], player[:Level], "You")
      if monster[:Health] <= 0 
        puts "Monster is dead!"
        player[:Exp] += exp_calc(monster[:Level])
        player[:Gold] += gold_calc(player[:Luck])
        return
      end
      player[:Health] -= damage_calc(monster[:Strength], monster[:Luck], monster[:Level], "The monster")
      if player[:Health] <= 0
        puts "You died!"
        return
      end
    end
  end
end

def damage_calc(strength, luck, level, attacker)
  to_hit = rand(200..1000) * luck
  dam = rand(strength*(level*10)) * luck

  if to_hit >= 80
    if attacker == "You"
      print "You attack the monster...."
    else
      print"The monster attacks you..."
    end
    puts "#{dam.to_i} points of damage!"
    return dam.to_i
  else 
    return 0
  end
end

def exp_calc(monster_level)
  return monster_level * rand(2..500)
end

def gold_calc(player_luck)
  gold_found = player_luck * rand(50..250)
  return gold_found.to_i
end