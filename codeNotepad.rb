def draw_map(player, current_level, level_name)
  map_str ="
  0-----0   0-----0   0-----0   0-----0     #{player[:Name]}.
  |     |---|     |---|     |---|     |     Level: #{player[:Level]}.
  |     |---|     |---|     |---|     |     Health: #{player[:Health]}.
  |     |   |     |   |     |   |     |     Current Weapon: #{player[:Weapon]}.
  0-----0   0-----0   0-----0   0-----0     Current Armour: #{player[:Armour]}.
    | |       | |       | |       | |       Strength: #{player[:Strength]}.
  0-----0   0-----0   0-----0   0-----0     Defence: #{player[:Defence]}.
  |     |---|     |---|     |---|     |     Gold: #{player[:Gold]}.
  |     |---|     |---|     |---|     |.
  |     |   |     |   |     |   |     |     Floor: #{current_level}.
  0-----0   0-----0   0-----0   0-----0     #{level_name}.
    | |       | |       | |       | |  .
  0-----0   0-----0   0-----0   0-----0            N   .
  |     |   |     |---|     |---|     |            |   .
  |     |   |     |---|     |---|     |         W--@--E.
  |     |   |     |   |     |   |     |            |   .
  0-----0   0-----0   0-----0   0-----0            S   ."

  system("clear") || system("cls")
  temp_map = map_str.split(".")
  
  # puts(temp_map[5][5..7])
  # puts(temp_map[5][15..17])
  # puts(temp_map[5][25..27])
  # puts(temp_map[5][35..37])
  
  toreplace = temp_map[5][5..37]
  replacetxt = "x x       x x       x x       x x"
  
  temp_map[5][5..37]=replacetxt
  
  puts("")
  print(temp_map[11])
  puts("")
  #temp_map[room[0]][room[1]] = "X"
  return_map = temp_map.join("")
  puts(return_map)
end

player = {
  :Name => "NONE",
  :Weapon => "Sword",
  :Weapon_Bonus => 0,
  :Armour => "None",
  :Armour_Bonus => 0,
  :Level => 1,
  :Exp => 0,
  :Health => 100,
  :Strength => 7,
  :Defence => 3,
  :Gold => 0,
  :Luck => 0
}

current_level = 0
level_name = "The Cave Entrance"

draw_map(player, current_level, level_name)