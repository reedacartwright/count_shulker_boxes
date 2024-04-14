# update number of ticks
scoreboard players add timer csb_global 1

# Reset Results
# scoreboard players reset * csb_results

# Reset Burn-in notification
scoreboard players reset WaitingForData csb_results

# Indicate Number of Boxes
scoreboard players operation NumBoxes csb_results = box_count csb_global

# Update Time
scoreboard players operation TimerTicks csb_results = timer csb_global
scoreboard players operation TimerMinutes csb_results = timer csb_global
scoreboard players operation TimerMinutes csb_results /= k_1200 csb_global

# Time Stats
execute if score box_count csb_global matches 0.. run scoreboard players operation TimeLastSig csb_results = last_tick csb_global
execute if score box_count csb_global matches 0.. run scoreboard players operation TimeTotal csb_results = tick_span csb_global

execute unless score fill_ticks_1 csb_global matches 0 run scoreboard players operation FillTime1 csb_results = fill_ticks_1 csb_global
execute unless score fill_ticks_2 csb_global matches 0 run scoreboard players operation FillTime2 csb_results = fill_ticks_2 csb_global
execute unless score fill_ticks_3 csb_global matches 0 run scoreboard players operation FillTime3 csb_results = fill_ticks_3 csb_global
execute unless score fill_ticks_4 csb_global matches 0 run scoreboard players operation FillTime4 csb_results = fill_ticks_4 csb_global
execute unless score fill_ticks_5 csb_global matches 0 run scoreboard players operation FillTime5 csb_results = fill_ticks_5 csb_global

execute if score box_count csb_global matches 1.. run scoreboard players operation FillTimeAvg csb_results = fill_ticks_avg csb_global
execute if score box_count csb_global matches 1.. run scoreboard players operation DropRate csb_results = drop_rate csb_global

execute if score box_count csb_global matches 2.. run scoreboard players operation FillTimeVar csb_results = fill_ticks_var csb_global
