# Main cycle - detect day/night changes and update entities
execute if time matches 0..100 run function fnaf:daytime_cycle
execute if time matches 13000 run function fnaf:nighttime_cycle
execute if time matches 13100 run function fnaf:activate_hunting
