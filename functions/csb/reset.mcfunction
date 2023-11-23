# Setup Scoreboards
scoreboard objectives add csb_global dummy
scoreboard objectives add csb_results dummy "  CSB RESULTS  "
scoreboard objectives setdisplay sidebar csb_results
scoreboard objectives setdisplay list csb_results

# Reset
scoreboard players reset * csb_global
scoreboard players reset * csb_results

# Setup the State to Off
scoreboard players set csb_state csb_global 0

# Setup Constants
scoreboard players set k_1200 csb_global 1200
scoreboard players set k_alpha csb_global 124416000

# Setup Stats
scoreboard players set box_count csb_global -1
scoreboard players set first_tick csb_global 2147483647
scoreboard players set last_tick csb_global 0
scoreboard players set tick_diff csb_global 0

# Setup 
scoreboard players set TimerTicks   csb_results 0
scoreboard players set TimerMinutes csb_results 0
