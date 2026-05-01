# Initialization - Run once at world start
scoreboard objectives add fnaf_time dummy
scoreboard objectives add fnaf_showtime_type dummy
scoreboard objectives add fnaf_day_night dummy

# Set showtime types (1=singing, 2=dancing, 3=guitar)
scoreboard players set freddy_showtime fnaf_showtime_type 1
scoreboard players set chica_showtime fnaf_showtime_type 2
scoreboard players set bonnie_showtime fnaf_showtime_type 3
scoreboard players set foxy_showtime fnaf_showtime_type 1
scoreboard players set golden_freddy_showtime fnaf_showtime_type 2
