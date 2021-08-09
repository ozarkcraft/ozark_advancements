scoreboard objectives add ozark_adv dummy [{"text":"Advancements", "color":"green"},{"text":" (91)", "color":"gold"}]
scoreboard objectives setdisplay sidebar ozark_adv
schedule function ozark:update_score 5s
