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
  system("clear") || system("cls")
  puts opening_str
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
  system("clear") || system("cls")
  puts splash
end