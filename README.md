
<div align=center>
<img alt="recipe" src="/docs/images/vexp_logo.png" width=100%/>
</div>

# Introducción

Este proyecto es un paquete de expansión estilo Vanilla para Minecraft 1.21+. Es un proyecto inspirado en una serie de ideas que llegué a implementar en minecraft por los años 2020-2021, en esos años minecraft estaba experimentando un nuevo "boom" con la 1.16.

Lamentablemente ese proyecto antiguo se perdió con el tiempo (cambios de pc y otras posibles causas)

Afortunadamente ahora con los años he mejorado mucho tanto en arte como en programación y con Git y Github estoy desarrollando un proyecto de expansión para minecraft vanilla, sencillamente llamado **Vanilla Expansion Pack**.

# Estructura del proyecto

Este proyecto incluye `datapack` y `resource pack`:

## Datapack

Definido en `/datapack`

Carpeta con toda la lógica del paquete de expansión. Utilizando únicamente funciones `.mcfunction`.

## Resourcepack

Definido en `/resourcepack`

Carpeta con los recursos visuales usados por el paquete de expansión.

> [!WARNING] Importante
>Este paquete de expansión utiliza en **gran parte** modelos y texturas personalizadas, así como cambios sutiles en modelos y texturas vanilla, **recominendo encarecidamente** no utilizar paquetes de recursos que rompan mucho la estética vanilla.

# Requisitos de instalación

- Únicamente una versión de juego actualizada, versión superior a 1.21.

# Contenido del proyecto

A continuación veeremos una breve introducción de cada apartado del proyecto.

## Expansiones

- [Dungeons](/docs/dungeons.md)
- [Cocina](/docs/cooking.md)

## Sistemas implementados

Dentro de `datapack` he desarrollado una serie de sistemas escalables y optimizados (expresamente diseñados para multijugador), incluye:

- custom_blocks : Sistema de bloques personalizados.
- custom_mobs: Sistemas de mobs personalizados.
- dungeons: Sistema de combate nuevo.
- mob_health: Indicadores de vida para mobs.
- projectile: Sistema de projectiles personalizados.

- utils: Funciones auxiliares

---

## Estructuras personalizadas

Recientemente se ha implementado una forma 100% nativa dentro del juego de diseñar y programar estructuras para spawneen de forma natural en el mundo, en `vexp/structure` se incluirán estructuras personalizadas, y en `minecraft/structure` se mejorarán y se hará "rework" de estructuras vanilla.

---

## Encantamientos personalizados

Desde que el juego permite de forma nativa definir encantamientos nuevos, añadir encantamientos nuevos nunca ha sido más fácil, en `vexp/enchantment` se incluirán encantamientos nuevos, y en `minecraft/enchantment` encantamientos vanilla podrán verse alterados levemente (para que encajen con el sistema de combate nuevo).

# Échale un vistazo en profundidad a cada apartado

1. [Bloques personalizados](/docs/custom_blocks.md)
2. [Mobs personalizados](/docs/custom_mobs.md)
3. [Sistema de combate estilo "Dungeons"](/docs/dungeons.md)

## ¿Qué incluye el proyecto?

El repositorio se divide en dos partes principales:

- datapack: lógica de juego (funciones, recetas, loot, predicados, tags).
- resourcepack: modelos, texturas, overrides de items, partículas y assets visuales.

Estructura base:

- datapack/data/vexp/function: sistemas principales del proyecto.
- datapack/data/vexp/recipe: recetas custom de armas y objetos.
- datapack/data/vexp/predicate: condiciones reutilizables para lógica de combate.
- datapack/data/vexp/structure: estructuras personalizadas.
- datapack/data/vexp/tags: diferentes tags utilizadas para clasificar items, bloques y entidades
- resourcepack/assets/vexp: assets visuales propios del pack.

## Sistemas principales

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
