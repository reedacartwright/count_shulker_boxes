# update number of ticks
scoreboard players add timer csb_global 1

# Reset Results
# scoreboard players reset * csb_results

# Signal Burnin
execute unless score box_count csb_global matches 0.. run scoreboard players set WaitingForData csb_results 1
execute if score box_count csb_global matches 0.. run scoreboard players reset WaitingForData csb_results

# Signal Body
execute if score box_count csb_global matches 0.. run scoreboard players operation NumBoxes csb_results = box_count csb_global

# Update Time
scoreboard players operation TimerTicks csb_results = timer csb_global
scoreboard players operation TimerMinutes csb_results = timer csb_global
scoreboard players operation TimerMinutes csb_results /= k_1200 csb_global

# Time Stats
execute if score box_count csb_global matches 0.. run scoreboard players operation TimeFirstBox csb_results = first_tick csb_global
execute if score box_count csb_global matches 0.. run scoreboard players operation TimeLastBox csb_results = last_tick csb_global
execute if score box_count csb_global matches 0.. run scoreboard players operation TimeTotal csb_results = tick_span csb_global

execute unless score tick_diff1 csb_global matches 0 run scoreboard players operation TimeSpan1 csb_results = tick_diff1 csb_global
execute unless score tick_diff2 csb_global matches 0 run scoreboard players operation TimeSpan2 csb_results = tick_diff2 csb_global
execute unless score tick_diff3 csb_global matches 0 run scoreboard players operation TimeSpan3 csb_results = tick_diff3 csb_global
execute unless score tick_diff4 csb_global matches 0 run scoreboard players operation TimeSpan4 csb_results = tick_diff4 csb_global
execute unless score tick_diff5 csb_global matches 0 run scoreboard players operation TimeSpan5 csb_results = tick_diff5 csb_global

execute if score box_count csb_global matches 1.. run scoreboard players operation TimeSpanAvg csb_results = tick_avg csb_global
execute if score box_count csb_global matches 1.. run scoreboard players operation DropRate csb_results = drop_rate csb_global


