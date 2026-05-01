# Nighttime cycle - switch to hunting mode
event entity @e[family=freddy] fnaf:switch_to_nighttime
event entity @e[family=chica] fnaf:switch_to_nighttime
event entity @e[family=bonnie] fnaf:switch_to_nighttime
event entity @e[family=foxy] fnaf:switch_to_nighttime
event entity @e[family=golden_freddy] fnaf:switch_to_nighttime

# Play sound or particle effects for activation
execute as @e[family=freddy] run particle minecraft:portal ~~1~

tellraw @a {"text":"The animatronics are awakening...","color":"red"}
