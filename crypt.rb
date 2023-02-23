def draw_map(room, map)
  system("clear") || system("cls")
  temp_map = map.split(".")
  temp_map[room[0]][room[1]] = "X"
  return_map = temp_map.join(".")
  return return_map
end

def room_numbers(number)
  room_centre = 
  [[14, 4], [8, 4], [2 ,4],
  [2, 14], [8, 14], [8, 24],
  [8, 34], [2, 34], [2, 24]]
  return room_centre[number]
end

def room_directions(current_room, direction)
  connection_rooms = { 
    "0" => {"NORTH" => 1},
    "1" => {"NORTH" => 2, "SOUTH" => 0},
    "2" => {"EAST" => 3, "SOUTH" => 1},
    "3" => {"EAST" => 8, "SOUTH" => 4, "WEST" => 2},
    "4" => {"NORTH" => 3, "EAST" => 5},
    "5" => {"NORTH" => 8, "EAST" => 6, "WEST" => 4},
    "6" => {"NORTH" => 7, "WEST" => 5},
    "7" => {"SOUTH" => 6, "WEST" => 8},
    "8" => {"EAST" => 7, "SOUTH" => 5, "WEST" => 3},
  }
  
  return connection_rooms[current_room][direction]
end 

def compass(number)
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


map_str ="
0-----2   0-----3   0-----8   0-----7.
|     |---|     |---|     |---|     |.
|     |---|     |---|     |---|     |.
|     |   |     |   |     |   |     |.
0-----0   0-----0   0-----0   0-----0.
  | |       | |       | |       | |  .
0-----1   0-----4   0-----5   0-----6.
|     |   |     |---|     |---|     |.
|     |   |     |---|     |---|     |.
|     |   |     |   |     |   |     |.
0-----0   0-----0   0-----0   0-----0.
  | |                                .
0-----0                        N     .
|     |                        |     .
|     |                     W--@--E  .
|     |                        |     .
0-----0                        S     ."

#in the form y, x
room0 = [14, 4]
player_location = room0
current_room = 0

while true
  puts(draw_map(player_location, map_str))
  
  options = compass(current_room.to_i)
  puts("Type #{options} to move.")
  
  print("Enter room number: ")
  current_room = gets.chomp
  
  player_location = room_numbers(current_room.to_i)
end