## Proyecto de mods vanilla para minecraft

Proyecto de datapacks y paquetes de recursos para minecraft.

## Todo List and ideas.

## Unificar modelos de Items y bloques.

- [ ] Crear sprites 2d para todos los modelos del juego (?)

## Unificar sistema de feedback, efectos de partículas y sonidos.

- [ ] Implementar un sistema en /utils donde tener preconfigurados efectos de partículas y sonidos para que sea mas facil usarlos en los diferentes sistemas de armas, armaduras, etc.

## Assets para diseño de interiores

Items y bloques nuevos para mejorar los interiores de los hogares.(Equilibrio de detalle, rendimiento y nada fuera del estilo vanilla)

- [x] Sillas funcionales.
- [x] Puertas Suaves.

## Items Decorativos funcionales

Implementación de items decorativos y funcionales para el gameplay.

- [ ] Jarra (almacena items dentro).
- [ ] Soportes para armas.
- [ ] Soporte para velas.
- [ ] Cestas (Puedes colocar dentro un bloque o varios items) (?) 

## Actualización de Aventura (Mecánicas nuevas)

Implementar mecánicas para complementar el sistema de movimiento y exploración (complementando el sistema de combate). Implementar movimientos nuevos como:

- [x] Dash o Esquive.
- [x] Escalado de paredes.
- [x] Base técnica movement/ (tick, cooldowns y eventos).

## Actualización de Armas (Estilo Minecraft Dungeons / Vanilla+)

Implementación importante de un nuevo sistema de combate (con soporte de combos, ataques especiales, etc.)
Implementaremos un sistema de armas nuevas, inspirado en las armas de minecraft dungeons. Cada una tendrá mecánicas de combate diferentes:

Nuevas variantes de Calidad de armas:

3 Ramas a elegir:

1. Netherite (Standar) -> Fuerza bruta del nether.
2. Resonante. -> Inspirado por el warden.
3. Amatista. -> Enfocado a magia y encantamientos

Nota: Estas variante de calidad serán las únicas que tengan habilidad de click derecho.

Armas nuevas a implementar:

- [x] Dagas:
  - Velocidad de ataque rápida.
  - Daño reducido.
  - Área de daño mínimo
  - Arrojable con click derecho.
  - On Hit: Pushback ligero.
  - On Combo: Pushback fuerte y Retroceso.

- [x] Guanteletes.
  - Velocidad de ataque muy rápida.
  - Daño mínimo.
  - Área de daño mínimo.
  - Click derecho: Parry, el jugador en un breve instante pierde velocidad, pero si recibe daño, aplicará pushback a los mobs cercanos, y luego ganará velocidad adicional por un breve instante.
  - On Hit: Pushback ligero.
  - On Combo: Retroceso.

- [x] Guadañas.
  - Velocidad de ataque lenta.
  - Daño alto.
  - Área de daño amplio.
  - Click derecho: Lanza un proyectil que inflige daño y aplica lentitud.
  - On Hit: Pushback ligero.
  - On Combo: Retroceso.

-[x] Rapiers.

- Velocidad de ataque rápida.
- Daño bajo.
- Área de daño mínimo
- Click derecho: Lunge, el jugador avanza hacia adelante y atraviesa al mob, le aplica efecto de sangrado (wither por 3s), y gana un instante de invisibilidad breve.

- [x] Espadas.
  - Velocidad de ataque media.
  - Daño medio.
  - Área de daño bajo.
  - Click derecho: Ataque circular, el jugador gira progresivamente durante un 1 segundo, aplicando daño de área a los mobs cercanos.

## Actualización de Armaduras (Estilo Minecraft Dungeons / Vanilla+)

Para complementar el sistema de armas, implementaremos un sistema de armaduras nuevas, inspirado en las armaduras de minecraft dungeons. Cada una tendrá mecánicas de combate diferentes:

- [ ] Armaduras mejoradas.
  - Armaduras con habilidades pasivas especiales.

Armaduras nuevas a implementar:

- [ ] Armadura de netherita.
- [ ] Armadura resonante.
- [ ] Armadura de amatista.

## Actualización de Pirotecnia

- [x] TNT lanzable.
- [ ] Bengalas.
- [x] Pistola de mano.

## Actualizaciones varias (misceláneas)

- [x] Barras de vida para mobs. (Visualización de la vida de los mobs).
- [x] Indicadores de daño para mobs. (Visualización del daño recibido por los mobs).
- [ ] Mejor feedback visual para el combate o movimiento del jugador.
