# 🍦 Vanilla Expansion Pack

Pack Vanilla+ para Minecraft basado en datapack + resourcepack.

El objetivo del proyecto es ampliar combate, proyectiles, bloques funcionales y utilidades visuales manteniendo estética vanilla.

## 📋 Lista de cambios e ideas futuras a implementar

Aquí tendrás una lista de de cambios futuros o ideas nuevas para expandir la experiencia vanilla del juego:

- [docs/todo-list.md](/docs/todo)

## ℹ️ ¿Qué incluye el proyecto?

El repositorio se divide en dos partes principales:

- datapack: lógica de juego (funciones, recetas, loot, predicados, tags).
- resourcepack: modelos, texturas, overrides de items, partículas y assets visuales.

Estructura base:

- datapack/data/vexp/function: sistemas principales del proyecto.
- datapack/data/vexp/recipe: recetas custom de armas y objetos.
- datapack/data/vexp/predicate: condiciones reutilizables para lógica de combate.
- resourcepack/assets/vexp: assets visuales propios del pack.

## 🧩 Sistemas principales

### Custom Block System

Sistema para bloques funcionales que se comportan como entidades/lógica custom sin romper el flujo vanilla.

Qué hace:

- Detecta colocación e interacción.
- Gestiona comportamiento por tick cuando aplica.
- Controla rotura, drops y limpieza de estado.

Dónde vive:

- datapack/data/vexp/function/custom_block

Flujo típico:

1. Colocación del bloque custom.
2. Registro de estado y metadatos.
3. Tick/interacción para aplicar comportamiento.
4. Rotura y drop controlado.

### Custom Weapon + Combo System

Sistema de combate modular inspirado en Minecraft Dungeons: cada familia de arma tiene su comportamiento base y variantes por calidad.

Qué hace:

- Maneja click izquierdo, click derecho, on hit, combo y parry según arma.
- Aplica cooldown, attack speed y daño por configuración NBT.
- Enruta eventos por calidad (por ejemplo netherite, echo, gold, diamond) para comportamiento especial.

Dónde vive:

- datapack/data/vexp/function/dungeons
- datapack/data/vexp/function/dungeons/combo_system

Flujo típico:

1. El jugador usa un arma con custom_data.combo.
2. El router de combo detecta evento (on_hit, on_combo, on_right_click, on_parry).
3. Se llama al handler de la familia de arma y/o calidad.
4. Se aplican efectos, daño, movilidad y feedback.

### Custom Projectile System

Sistema unificado para crear, inicializar y mover proyectiles usando entidades base con data.proj.

Qué hace:

- Spawn unificado con asignación de owner e inicialización.
- Movimiento por módulos: standard, erratic, orbit, spin, homing.
- Hooks por tipo de proyectil: on_spawn, on_tick, on_hit_mob, on_hit_block, on_despawn.
- Soporta homing discriminatorio por tag de exclusión en data.proj.

Dónde vive:

- datapack/data/vexp/function/projectile
- datapack/data/vexp/function/projectile/projectiles

Flujo típico:

1. Un sistema de arma crea proyectil base (armor stand marker).
2. projectile/spawn inicializa tags, owner, parámetros y hook on_spawn.
3. projectile/tick ejecuta movimiento y colisiones.
4. Hooks de impacto/despawn resuelven efectos finales.

Ejemplo de homing discriminatorio:

- Si un proyectil tiene data.proj.exclude_tag:"nether_marked", hará homing solo a objetivos válidos que no tengan esa tag.

## 🚀 Cómo extender el proyecto

Ruta recomendada para añadir contenido nuevo:

1. Crear receta y custom_data del arma/item en datapack/data/vexp/recipe.
2. Añadir handler en datapack/data/vexp/function/dungeons/<familia>.
3. Si usa proyectiles, definir tipo en projectile/projectiles/<tipo> con hooks.
4. Añadir modelos/texturas en resourcepack.
5. Validar coherencia entre receta, give, cooldown y quality.

## 📌 Estado general

Implementado actualmente (alto nivel):

- Sistema de armas con varias familias (daggers, gauntlets, scythes, rapiers, swords).
- Sistema de proyectiles modular.
- Bloques/objetos funcionales y utilidades de combate.

Pendiente o en evolución:

- Más armaduras con pasivas.
- Más objetos decorativos funcionales.
- Mejoras de feedback visual y sonoro centralizado.

## 📚 Documentación técnica

Guía de mantenimiento y expansión en:

- docs/README.md
- docs/custom-blocks.md
- docs/projectiles.md
- docs/combo-system.md
- docs/custom-weapons.md
- docs/visual-health-damage.md
