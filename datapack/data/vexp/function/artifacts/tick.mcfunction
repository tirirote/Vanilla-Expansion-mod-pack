# Main artifacts tick

# Start of tick cleanup
tag @a[tag=vexp.artifact_activate] remove vexp.artifact_activate

# Cleanup by type
function vexp:artifacts/cleanup

# Vanilla totem replace
execute as @a if items entity @s weapon.mainhand totem_of_undying unless items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/replace_vanilla_totem {slot:"weapon.mainhand"}
execute as @a if items entity @s weapon.offhand totem_of_undying unless items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run function vexp:artifacts/replace_vanilla_totem {slot:"weapon.offhand"}

# Check if the player has a valid artifact
execute as @a if entity @s[tag=vexp.artifact_user] unless items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] unless items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run tag @s remove vexp.artifact_user

# Check if the player has a valid artifact
execute as @a unless entity @s[tag=vexp.artifact_user] if items entity @s weapon.offhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run tag @s add vexp.artifact_user
execute as @a unless entity @s[tag=vexp.artifact_user] if items entity @s weapon.mainhand totem_of_undying[custom_data={vexp:{item:"artifact"}}] run tag @s add vexp.artifact_user

# When player is holding a valid artefact
execute as @a[tag=vexp.artifact_user] at @s run function vexp:artifacts/check

# Artifact FX Lifetime
execute as @e[type=item_display,tag=vexp.artifact_item_spin] at @s run function vexp:artifacts/item_spin_tick

# Specific Tick for artifacts
# Mask friends mob re-target
execute as @e[tag=vexp.mask_friend] at @s run damage @s 0.1 generic by @e[type=#vexp:hostile,tag=!vexp.mask_friend,nbt={HurtTime:10s},limit=1,sort=nearest,distance=..16]
