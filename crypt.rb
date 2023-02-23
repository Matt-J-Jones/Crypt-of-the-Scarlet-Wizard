def title
  opening_str = <<-'EXPECTED'
    _, __, , _ __, ___    _, __,   ___ _,_ __,          
 / ` |_) \ | |_)  |    / \ |_     |  |_| |_           
 \ , | \  \| |    |    \ / |      |  | | |            
  ~  ~ ~   ) ~    ~     ~  ~      ~  ~ ~ ~~~          
          ~'                                          
  _,  _,  _, __, _,  __, ___   _  _ _ ___,  _, __, __,
 (_  / ` /_\ |_) |   |_   |    |  | | ` /  /_\ |_) | \
 , ) \ , | | | \ | , |    |    |/\| |  /   | | | \ |_/
  ~   ~  ~ ~ ~ ~ ~~~ ~~~  ~    ~  ~ ~ ~~~  ~ ~ ~ ~ ~ 
                                  Press ENTER to play.
  EXPECTED
  puts(opening_str)
  gets.chomp
end

def end_screen
  splash  = <<-'EXPECTED'
 , _  _, _,_   __, _ __, __,
 \ | / \ | |   | \ | |_  | \
  \| \ / | |   |_/ | |   |_/
   )  ~  `~'   ~   ~ ~~~ ~  
  ~'              GAME OVER.
  EXPECTED
end

def draw_map(room, player, current_level, level_name)
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
  #in the form y, x
  room_centre = 
  [[14, 6], [8, 6], [2 ,6],
  [2, 16], [8, 16], [8, 26],
  [8, 36], [2, 36], [2, 26]]
  return room_centre[number]
end

def room_directions(current_room, direction)
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

def player_name_gen
  file = File.open("names.txt", "r")
  names = file.read.split("\n")
  file.close
  return names.sample 
end

#in the form y, x
room0 = [14, 6]
player_location = room0
current_room = 0
name = player_name_gen

player = {
  :Name => name,
  :Weapon => "Sword",
  :Weapon_Bonus => 0,
  :Armour => "None",
  :Armour_Bonus => 0,
  :Level => 1,
  :Health => 100,
  :Strength => 7,
  :Defence => 3,
  :Gold => 0,
  :Luck => 0
}

current_level = 0
level_name = "The Cave Entrance"

title

while true
  draw_map(player_location, player, current_level, level_name)
  
  options = compass(current_room.to_i)
  puts("Type #{options} to move.")
  
  print(": ")
  direction = gets.chomp
  if options.include?(direction.upcase)
    current_room = room_directions(current_room, direction.upcase)
  end
  
  player_location = room_numbers(current_room)
end