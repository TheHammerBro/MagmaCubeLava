##############################################################################################
#                                                                                            #
#  _____  _             _   _                                           ______               #
# |_   _|| |           | | | |                                          | ___ \              #
#   | |  | |__    ___  | |_| |  __ _  _ __ ___   _ __ ___    ___  _ __  | |_/ / _ __   ___   #
#   | |  | '_ \  / _ \ |  _  | / _` || '_ ` _ \ | '_ ` _ \  / _ \| '__| | ___ \| '__| / _ \  #
#   | |  | | | ||  __/ | | | || (_| || | | | | || | | | | ||  __/| |    | |_/ /| |   | (_) | #
#   \_/  |_| |_| \___| \_| |_/ \__,_||_| |_| |_||_| |_| |_| \___||_|    \____/ |_|    \___/  #
#                                                                                            #
#                                                                                            #
#   Author : Ryan Hammer                                                                     #
#   Project: https://github.com/TheHammerBro/MC_magmacubelava                                #
#                                                                                            #
##############################################################################################

# convert Obsidian to lava (size dependant)
execute as @s[nbt={Size: 0}] run fill ~-.1 ~-.25 ~-.1 ~.1 ~-.25 ~.1 lava replace obsidian
execute as @s[nbt={Size: 1}] run fill ~-.3 ~-.25 ~-.3 ~.3 ~-.25 ~.3 lava replace obsidian
execute as @s[nbt={Size: 3}] run fill ~-.6 ~-.25 ~-.6 ~.6 ~-.25 ~.6 lava replace obsidian

# remove 1000 heat
scoreboard players remove @s magcubelava_heat 1000

# conversion effects
particle soul_fire_flame ~ ~ ~ .1 .1 .1 1 100 normal
playsound block.fire.extinguish block @a ~ ~-.5 ~ 2 1.2