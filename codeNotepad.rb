require './fight'

player = {:Health => 5000, :Strength => 100, :Luck => 1.1, :Level => 1, :Exp => 0, :Gold => 0}
monster = {:Health => 1000, :Strength => 75, :Luck => 0.5, :Level => 1}

fight(player, monster)
puts "Your health: #{player[:Health]}"
puts "Exp gained: #{player[:Exp]}"
puts "Gold found: #{player[:Gold]}"