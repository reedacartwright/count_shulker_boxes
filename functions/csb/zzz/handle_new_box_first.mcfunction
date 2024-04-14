# change state to signal that burnin is over
scoreboard players set csb_state csb_global 2

# Signal of first tick
scoreboard players operation last_tick csb_global = timer csb_global
scoreboard players operation prev_tick csb_global = last_tick csb_global
