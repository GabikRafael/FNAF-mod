# Daytime cycle - switch to showtime mode
event entity @e[family=freddy] fnaf:switch_to_daytime
event entity @e[family=chica] fnaf:switch_to_daytime
event entity @e[family=bonnie] fnaf:switch_to_daytime
event entity @e[family=foxy] fnaf:switch_to_daytime
event entity @e[family=golden_freddy] fnaf:switch_to_daytime

# Teleport to markers
execute as @e[family=freddy] at @e[name=marker_freddy] run tp @s ~~0.5~
execute as @e[family=chica] at @e[name=marker_chica] run tp @s ~~0.5~
execute as @e[family=bonnie] at @e[name=marker_bonnie] run tp @s ~~0.5~
execute as @e[family=foxy] at @e[name=marker_foxy] run tp @s ~~0.5~
execute as @e[family=golden_freddy] at @e[name=marker_golden_freddy] run tp @s ~~0.5~
