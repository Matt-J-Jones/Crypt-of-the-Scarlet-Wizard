def player_name_gen
  # Randomly generates the players name from a preset list.
  file = File.open("names.txt", "r")
  names = file.read.split("\n")
  file.close

  firstname = []
  surname = []

  names.each { |name|
    temp = name.split(" ")
    firstname << temp[0]
    surname << temp[1]
  }
  return_name = Array.new
  return_name << [firstname.sample, surname.sample]
  return return_name.join(" ")
end