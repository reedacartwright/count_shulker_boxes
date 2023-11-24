# Update M2
scoreboard players operation delta1 csb_global = fill_ticks_1 csb_global
scoreboard players operation delta1 csb_global -= prev_fill_ticks_avg csb_global
scoreboard players operation delta2 csb_global = fill_ticks_1 csb_global
scoreboard players operation delta2 csb_global -= fill_ticks_avg csb_global
scoreboard players operation delta1 csb_global *= delta2 csb_global
scoreboard players operation fill_ticks_m2 csb_global += delta1 csb_global

# Update Sample Variance
scoreboard players operation n_minus_1 csb_global = box_count csb_global
scoreboard players remove n_minus_1 csb_global 1

scoreboard players operation fill_ticks_var csb_global = fill_ticks_m2 csb_global
scoreboard players operation fill_ticks_var csb_global /= n_minus_1 csb_global
