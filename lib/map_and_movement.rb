def draw_map(room, player, current_level, level_name)

  # Passes in player location (room), player hash (player), and the current level and it's name.
  # generates new map with each refresh, changes player location and stats as needed.

  map_str ="
  0-----0   0-----0   0-----0   0-----0     #{player[:Name]}.
  |     |---|     |---|     |---|     |     Level: #{player[:Level]}.
  |     |---|     |---|     |---|     |     Health: #{player[:Health]}.
  |     |   |     |   |     |   |     |     Current Weapon: #{player[:Weapon]}.
  0-----0   0-----0   0-----0   0-----0     Current Armour: #{player[:Armour]}.
    | |       | |       | |       | |       Strength: #{player[:Strength]}.
  0-----0   0-----0   0-----0   0-----0     Defence: #{player[:Defence]}.
  |     |   |     |---|     |---|     |     Gold: #{player[:Gold]}.
  |     |   |     |---|     |---|     |.
  |     |   |     |   |     |   |     |.
  0-----0   0-----0   0-----0   0-----0     Floor: #{current_level}.
    | |                                     #{level_name}.
  0-----0                          N   .
  |     |                          |   .
  |     |                       W--@--E.
  |     |                          |   .
  0-----0                          S   ."
    
  system("clear") || system("cls")
  temp_map = map_str.split(".")
  temp_map[room[0]][room[1]] = "X"
  return_map = temp_map.join("")
  puts(return_map)
end

def room_numbers(number)

  # in the form y, x
  # takes the room numbert he player is in, returns the coordinates of it's centre

  room_centre = 
  [[14, 6], [8, 6], [2 ,6],
  [2, 16], [8, 16], [8, 26],
  [8, 36], [2, 36], [2, 26]]
  return room_centre[number]
end

def room_directions(current_room, direction)
  # Takes player's current room and where the player is moving to
  # returns the room number of where the player is traveling to.

  connection_rooms = { 
    0 => {"NORTH" => 1},
    1 => {"NORTH" => 2, "SOUTH" => 0},
    2 => {"EAST" => 3, "SOUTH" => 1},
    3 => {"EAST" => 8, "SOUTH" => 4, "WEST" => 2},
    4 => {"NORTH" => 3, "EAST" => 5},
    5 => {"NORTH" => 8, "EAST" => 6, "WEST" => 4},
    6 => {"NORTH" => 7, "WEST" => 5},
    7 => {"SOUTH" => 6, "WEST" => 8},
    8 => {"EAST" => 7, "SOUTH" => 5, "WEST" => 3},
  }
  
  return connection_rooms[current_room][direction]
end 

def compass(number)
  # Takes room number as input, outputs the location of the room's exits.
  
  room_exits = ["n","ns","es","esw","ne","new","nw","sw","esw"]
  compass_points = {"n" => "NORTH", "s" => "SOUTH", 
                     "e" => "EAST", "w" => "WEST"}
  options = []
  direction = room_exits[number].split("")
  direction.each { |point|
    options.push(compass_points[point])
  }
  options_str = options.join(", ")
  
  return options_str
end 