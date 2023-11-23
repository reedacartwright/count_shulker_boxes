scoreboard players add box_count csb_global 1

scoreboard players operation prev_tick csb_global = last_tick csb_global

scoreboard players operation first_tick csb_global < timer csb_global
scoreboard players operation last_tick csb_global > timer csb_global

execute unless score last_tick csb_global > first_tick csb_global run scoreboard players operation prev_tick csb_global = last_tick csb_global

scoreboard players operation tick_span csb_global = last_tick csb_global
scoreboard players operation tick_span csb_global -= first_tick csb_global

scoreboard players operation tick_diff5 csb_global = tick_diff4 csb_global
scoreboard players operation tick_diff4 csb_global = tick_diff3 csb_global
scoreboard players operation tick_diff3 csb_global = tick_diff2 csb_global
scoreboard players operation tick_diff2 csb_global = tick_diff1 csb_global

scoreboard players operation tick_diff1 csb_global = last_tick csb_global
scoreboard players operation tick_diff1 csb_global -= prev_tick csb_global

scoreboard players operation tick_avg csb_global = tick_span csb_global
execute if score box_count csb_global matches 1.. run scoreboard players operation tick_avg csb_global /= box_count csb_global
execute if score box_count csb_global matches 1.. run scoreboard players operation drop_rate csb_global = k_alpha csb_global
execute if score box_count csb_global matches 1.. run scoreboard players operation drop_rate csb_global /= tick_avg csb_global
