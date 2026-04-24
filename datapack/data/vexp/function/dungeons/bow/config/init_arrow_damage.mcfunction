# dungeons/bow/config/init_arrow_damage.mcfunction
# Initializes arrow damage configuration for all tiers and qualities
# Called once at datapack load

# Clear existing config
data remove storage vexp:arrow_config all

# Create damage config
# Format: {quality: {normal: damage, charged: damage}}
data modify storage vexp:arrow_config set set value {common: {normal: 6, charged: 8}, netherite: {normal: 8, charged: 10}, resonance: {normal: 9, charged: 11}, gold: {normal: 7, charged: 9}, diamond: {normal: 10, charged: 12}}

# Log config loaded
say [Vanilla Expansion] Arrow damage config initialized
