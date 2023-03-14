['./lib/screens', 
 './lib/map_and_movement', 
 './lib/fight', 
 './lib/name_generator'].each(&method(:require))

# in the form y, x
# generates the player's starting location (room 0), name, and stats.

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
  :Exp => 0,
  :Health => 100,
  :Strength => 7,
  :Defence => 3,
  :Gold => 0,
  :Luck => 1
}

# Current level, and the levels name.
current_level = 0
level_name = "The Cave Entrance"

# Display title splash
title

# Main play loop
while true

  # Draws map inc. player location and stats
  draw_map(player_location, player, current_level, level_name)
  
  # Displays list of avalbile directions to leave the room
  options = compass(current_room.to_i)
  puts("Type #{options} to move."); print(": ")
  direction = gets.chomp

  # Checks that the entered value of direction matches the choices of directions.
  # if value is not recognised, the choice loops until player inputs a valid direction
  # if player enters quit, the program ends

  if options.include?(direction.upcase)
    current_room = room_directions(current_room, direction.upcase)
  elsif direction == "quit"
    end_screen
    break
  end
  
  # Updates player's cuttenrly location 
  player_location = room_numbers(current_room)
end