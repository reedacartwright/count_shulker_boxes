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

## Calculate box_count * (1728 * 72000) / tick_span
## let alpha = 1728 * 72000
## let x = box_count
## int x0 = low_part(x) * alpha_lo;
## int x1 = low_part(x) * alpha_hi;
## x1 += high_part(x0);
## low = low_part(x0) + (low_part(x1) << 16);
## high = high_part(x1);

# let y = box_count * 1728 * 7200.
# split y into 4 16-bit words: y3..y0
# then calculate the result based on dividing the words and passing down the remainder

# x0 = x * low_part(alpha)
# scoreboard players operation math_v_x0 csb_global = box_count csb_global
# scoreboard players operation math_v_x0 csb_global *= k_alpha_lo csb_global

# # x1 = K * high_part(alpha)
# scoreboard players operation math_v_x1 csb_global = box_count csb_global
# scoreboard players operation math_v_x1 csb_global *= k_alpha_hi csb_global

# # x1 += high_part(x0)
# scoreboard players operation math_v_f  csb_global = math_v_x0 csb_global
# scoreboard players operation math_v_f  csb_global /= k_65536 csb_global
# scoreboard players operation math_v_x1 csb_global += math_v_f csb_global

# # y0 = low_part(x0)
# scoreboard players operation math_v_y0 csb_global = math_v_x0 csb_global
# scoreboard players operation math_v_y0 csb_global %= k_65536 csb_global

# # y1 = low_part(x1)
# scoreboard players operation math_v_y1 csb_global = math_v_x1 csb_global
# scoreboard players operation math_v_y1 csb_global %= k_65536 csb_global

# # y2 = high_part(x1)
# scoreboard players operation math_v_y2 csb_global = math_v_x1 csb_global
# scoreboard players operation math_v_y2 csb_global /= k_65536 csb_global

## FULL CODE FOR MULTIPLICATION

# x0 = x * low_part(alpha)
# scoreboard players operation math_v_x0 csb_global = box_count csb_global
# scoreboard players operation math_v_x0 csb_global *= k_alpha_lo csb_global

# # x1 = x * high_part(alpha)
# scoreboard players operation math_v_x1 csb_global = box_count csb_global
# scoreboard players operation math_v_x1 csb_global *= k_alpha_hi csb_global

# # x1 += high_part(x0)
# scoreboard players operation math_v_f  csb_global = math_v_x0 csb_global
# scoreboard players operation math_v_f  csb_global /= k_65536 csb_global
# scoreboard players operation math_v_x1 csb_global += math_v_f csb_global

# low = low_part(x0) + (low_part(x1) << 16);
# scoreboard players operation math_v_low csb_global = math_v_x0 csb_global
# scoreboard players operation math_v_low csb_global %= k_65536 csb_global
# scoreboard players operation math_v_f csb_global = math_v_x1 csb_global
# scoreboard players operation math_v_f csb_global *= k_65536 csb_global
# scoreboard players operation math_v_low csb_global += math_v_f csb_global

# # high = high_part(x1);
# scoreboard players operation math_v_high csb_global = math_v_x1 csb_global
# scoreboard players operation math_v_high csb_global /= k_65536 csb_global

## SIMPLIFIED CODE

# # x0 = x * low_part(alpha)
# scoreboard players operation math_v_x0 csb_global = box_count csb_global
# scoreboard players operation math_v_x0 csb_global *= k_alpha_lo csb_global

# # x1 = x * high_part(alpha)
# scoreboard players operation math_v_x1 csb_global = box_count csb_global
# scoreboard players operation math_v_x1 csb_global *= k_alpha_hi csb_global

# # x1 += high_part(x0)
# scoreboard players operation math_v_x0 csb_global /= k_65536 csb_global
# scoreboard players operation math_v_x1 csb_global += math_v_x0 csb_global

# # box_count * (1728 * 72000) / tick_span
# scoreboard players operation drop_rate csb_global = math_v_x1 csb_global
# scoreboard players operation drop_rate csb_global /= tick_span csb_global
