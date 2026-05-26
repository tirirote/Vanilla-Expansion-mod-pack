# Dungeons Architecture (Scalable Layout)

## Objectives

- Keep weapon behavior isolated by weapon and quality.
- Keep enchantment logic isolated from combo internals.
- Keep combo_system as orchestration, not feature dumping.
- Preserve backward compatibility while migrating paths.

## Folder Responsibilities

- `dungeons/weapons/*`
  - All weapon hooks (`on_hit`, `on_combo`, `on_right_click`, `on_parry`).
  - Quality variants inside each weapon folder (`gold`, `diamond`, `netherite`, `echo`, `glowing`).

- `dungeons/enchantments/vanilla/*`
  - Vanilla enchantment bridge logic for combo flow.

- `dungeons/enchantments/custom/*`
  - Custom enchantment logic and per-enchantment hooks.

- `dungeons/combo_system/*`
  - Combat orchestration only: hitbox lifecycle, wrappers, combo progression, and routing.
  - Feature-specific behavior should be delegated to `weapons` and `enchantments`.

## Combo Hook Layout

- `combo_system/hooks/hit/*`
  - Hit-time routing and hit feedback helpers.
- `combo_system/hooks/combo/*`
  - Combo-finisher routing.
- `combo_system/hooks/interact/*`
  - Right-click routing and cooldown application.
- `combo_system/hooks/parry/*`
  - Parry routing and parry helper effects.

## Compatibility Strategy

- Keep legacy wrappers in `combo_system/hooks/*` to avoid hard breaks.
- New code should call subfoldered hooks directly (`hit/`, `combo/`, `interact/`, `parry/`).
- During migration, wrappers should be thin forwards only.

## Rule of Thumb for New Features

1. Add behavior in `weapons` or `enchantments`, not directly in combo internals.
2. Add/adjust router in the corresponding `combo_system/hooks/<domain>/route_*.mcfunction`.
3. Keep wrappers updated only for backward compatibility.
4. Avoid duplicated routing logic between old and new paths.
