scoreboard objectives add ozark_adv dummy {"text":"Advancements (total: 91)"}
scoreboard objectives setdisplay sidebar ozark_adv
schedule function ozark:update_score 5s

#bossbar add ozark_adv {"text":"Advancements","color":"green","bold":true}
#bossbar set ozark_adv color green
