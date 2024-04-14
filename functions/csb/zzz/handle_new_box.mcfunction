# Increase Box Count
scoreboard players add box_count csb_global 1

# Update Tick Marks
scoreboard players operation prev_tick csb_global = last_tick csb_global
scoreboard players operation last_tick csb_global = timer csb_global

# Update Total Time Span
scoreboard players operation tick_diff csb_global = last_tick csb_global
scoreboard players operation tick_diff csb_global -= prev_tick csb_global
scoreboard players operation tick_span csb_global += tick_diff csb_global

# Keep Track of the Fill Time of the Five Most Recent Boxes
scoreboard players operation fill_ticks_5 csb_global = fill_ticks_4 csb_global
scoreboard players operation fill_ticks_4 csb_global = fill_ticks_3 csb_global
scoreboard players operation fill_ticks_3 csb_global = fill_ticks_2 csb_global
scoreboard players operation fill_ticks_2 csb_global = fill_ticks_1 csb_global
scoreboard players operation fill_ticks_1 csb_global = tick_diff csb_global

# Calculate Average Fill Time and Drop Rate
execute if score box_count csb_global matches 2.. run scoreboard players operation prev_fill_ticks_avg csb_global = fill_ticks_avg csb_global

execute if score box_count csb_global matches 1.. run scoreboard players operation fill_ticks_avg csb_global = tick_span csb_global
execute if score box_count csb_global matches 1.. run scoreboard players operation fill_ticks_avg csb_global /= box_count csb_global

execute if score box_count csb_global matches 1.. run scoreboard players operation drop_rate csb_global = k_alpha csb_global
execute if score box_count csb_global matches 1.. run scoreboard players operation drop_rate csb_global /= fill_ticks_avg csb_global

# Update Variance Estimate
execute if score box_count csb_global matches 2.. run function csb/zzz/calc_var
