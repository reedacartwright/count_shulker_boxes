# check handle_new_box first because it can change csb_state
execute if score csb_state csb_global matches 2.. run function csb/zzz/handle_new_box
execute if score csb_state csb_global matches 1   run function csb/zzz/handle_new_box_first
