# dungeons/bow/arrows/normalize_motion.mcfunction
# @s is the arrow entity.
# Normalizes Motion to approx unit length (|v| ~= 1.0) and stores it for per-tick reuse.

# Read original motion (scaled by 1000)
execute store result score #m_x vexp.math run data get storage vexp:temp arrow_motion[0] 1000
execute store result score #m_y vexp.math run data get storage vexp:temp arrow_motion[1] 1000
execute store result score #m_z vexp.math run data get storage vexp:temp arrow_motion[2] 1000

# len2 = x^2 + y^2 + z^2
scoreboard players operation #x2 vexp.math = #m_x vexp.math
scoreboard players operation #y2 vexp.math = #m_y vexp.math
scoreboard players operation #z2 vexp.math = #m_z vexp.math
scoreboard players operation #x2 vexp.math *= #m_x vexp.math
scoreboard players operation #y2 vexp.math *= #m_y vexp.math
scoreboard players operation #z2 vexp.math *= #m_z vexp.math
scoreboard players operation #len2 vexp.math = #x2 vexp.math
scoreboard players operation #len2 vexp.math += #y2 vexp.math
scoreboard players operation #len2 vexp.math += #z2 vexp.math

# Build abs(x), abs(y), abs(z) for a stable initial sqrt estimate.
scoreboard players operation #ax vexp.math = #m_x vexp.math
scoreboard players operation #ay vexp.math = #m_y vexp.math
scoreboard players operation #az vexp.math = #m_z vexp.math
execute if score #ax vexp.math matches ..-1 run scoreboard players operation #ax vexp.math *= #neg_one vexp.math
execute if score #ay vexp.math matches ..-1 run scoreboard players operation #ay vexp.math *= #neg_one vexp.math
execute if score #az vexp.math matches ..-1 run scoreboard players operation #az vexp.math *= #neg_one vexp.math

# Avoid divide-by-zero and init Newton-Raphson with len=max(abs components).
scoreboard players set #two vexp.math 2
scoreboard players set #scale1000 vexp.math 1000
scoreboard players operation #len vexp.math = #ax vexp.math
execute if score #ay vexp.math > #len vexp.math run scoreboard players operation #len vexp.math = #ay vexp.math
execute if score #az vexp.math > #len vexp.math run scoreboard players operation #len vexp.math = #az vexp.math
execute if score #len vexp.math matches 0 run scoreboard players set #len vexp.math 1

# sqrt(len2) approximation: len = (len + len2/len)/2
scoreboard players operation #tmp vexp.math = #len2 vexp.math
scoreboard players operation #tmp vexp.math /= #len vexp.math
scoreboard players operation #len vexp.math += #tmp vexp.math
scoreboard players operation #len vexp.math /= #two vexp.math
scoreboard players operation #tmp vexp.math = #len2 vexp.math
scoreboard players operation #tmp vexp.math /= #len vexp.math
scoreboard players operation #len vexp.math += #tmp vexp.math
scoreboard players operation #len vexp.math /= #two vexp.math
scoreboard players operation #tmp vexp.math = #len2 vexp.math
scoreboard players operation #tmp vexp.math /= #len vexp.math
scoreboard players operation #len vexp.math += #tmp vexp.math
scoreboard players operation #len vexp.math /= #two vexp.math
scoreboard players operation #tmp vexp.math = #len2 vexp.math
scoreboard players operation #tmp vexp.math /= #len vexp.math
scoreboard players operation #len vexp.math += #tmp vexp.math
scoreboard players operation #len vexp.math /= #two vexp.math

# n = v / |v| (still scaled by 1000)
scoreboard players operation #n_x vexp.math = #m_x vexp.math
scoreboard players operation #n_y vexp.math = #m_y vexp.math
scoreboard players operation #n_z vexp.math = #m_z vexp.math
scoreboard players operation #n_x vexp.math *= #scale1000 vexp.math
scoreboard players operation #n_y vexp.math *= #scale1000 vexp.math
scoreboard players operation #n_z vexp.math *= #scale1000 vexp.math
scoreboard players operation #n_x vexp.math /= #len vexp.math
scoreboard players operation #n_y vexp.math /= #len vexp.math
scoreboard players operation #n_z vexp.math /= #len vexp.math

# Check normalization quality: expected ~1000000 when |n| ~= 1.0 (scaled by 1000).
scoreboard players operation #nx2 vexp.math = #n_x vexp.math
scoreboard players operation #ny2 vexp.math = #n_y vexp.math
scoreboard players operation #nz2 vexp.math = #n_z vexp.math
scoreboard players operation #nx2 vexp.math *= #n_x vexp.math
scoreboard players operation #ny2 vexp.math *= #n_y vexp.math
scoreboard players operation #nz2 vexp.math *= #n_z vexp.math
scoreboard players operation #norm_len2 vexp.math = #nx2 vexp.math
scoreboard players operation #norm_len2 vexp.math += #ny2 vexp.math
scoreboard players operation #norm_len2 vexp.math += #nz2 vexp.math
execute store result entity @s data.vexp.motion_norm_len2 int 1 run scoreboard players get #norm_len2 vexp.math

# Base speed multiplier (scaled by 1000). 1550 => speed 1.55 blocks/tick.
scoreboard players set #bow_base_speed vexp.math 1500
scoreboard players operation #n_x vexp.math *= #bow_base_speed vexp.math
scoreboard players operation #n_y vexp.math *= #bow_base_speed vexp.math
scoreboard players operation #n_z vexp.math *= #bow_base_speed vexp.math
scoreboard players operation #n_x vexp.math /= #scale1000 vexp.math
scoreboard players operation #n_y vexp.math /= #scale1000 vexp.math
scoreboard players operation #n_z vexp.math /= #scale1000 vexp.math

# Save normalized vector as doubles and apply immediately.
data modify storage vexp:temp arrow_motion_norm set value [0.0d,0.0d,0.0d]
execute store result storage vexp:temp arrow_motion_norm[0] double 0.001 run scoreboard players get #n_x vexp.math
execute store result storage vexp:temp arrow_motion_norm[1] double 0.001 run scoreboard players get #n_y vexp.math
execute store result storage vexp:temp arrow_motion_norm[2] double 0.001 run scoreboard players get #n_z vexp.math
data modify entity @s data.vexp.motion_normalized set from storage vexp:temp arrow_motion_norm
data modify entity @s Motion set from storage vexp:temp arrow_motion_norm
