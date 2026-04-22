# Docs - Vanilla Expansion Pack

Esta carpeta contiene documentacion tecnica concisa para mantener y expandir el proyecto.

## Indice

- [Custom Block System](custom-blocks.md)
- [Custom Projectile System](projectiles.md)
- [Combo System](combo-system.md)
- [Custom Weapons](custom-weapons.md)
- [Visual Health and Damage System](visual-health-damage.md)

## Recomendacion de lectura

1. Leer primero combo-system.md y custom-weapons.md para entender el combate.
2. Leer projectiles.md para habilidades de click derecho y armas lanzables.
3. Leer custom-blocks.md para bloques interactivos.
4. Leer visual-health-damage.md para feedback de combate.

## Convenciones clave

- Las funciones core viven en datapack/data/vexp/function.
- La configuracion runtime usa NBT en data.<...> y scoreboards vexp.<...>.
- Muchos routers usan storage vexp:dungeons.weapon combo_params para evitar condiciones repetidas.
- Para proyectiles, usar siempre projectile/utils/create_armor_stand + projectile/spawn.
