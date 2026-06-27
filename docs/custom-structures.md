# Guía Oficial de Creación de Estructuras Modulares (Vexp)

Esta guía contiene los estándares técnicos, geométricos y de configuración necesarios para diseñar e implementar estructuras modulares utilizando el sistema nativo de **Jigsaw Blocks** en Minecraft 1.21.1.

---

## 1. Buenas Prácticas de Diseño y Geometría

Para que el motor de Minecraft encaje las piezas de LEGO tridimensionales sin generar agujeros de aire, cortes o fallos de spawn, es obligatorio cumplir tres reglas sagradas:

### A. La Regla de la Bounding Box (Caja de Colisión)
* **Contención Estricta:** Absolutamente todos los bloques de la estructura (incluyendo vallas, carteles, botones, antorchas y escaleras) deben estar **100% contenidos dentro del área delimitada** por las líneas del *Structure Block*.
* **Consecuencias:** Si un solo bloque o saliente se queda fuera de la caja invisible del `.nbt`, el motor de Minecraft descartará la pieza por riesgo de colisión ilegal y forzará el cierre de la mazmorra con una pieza de `fallback`.

### B. Modularidad y Unidades de Medida Base
* Definid siempre un **"Bloque Patrón"** o escala estándar para los pasillos y salas (por ejemplo, pasillos de $5\times5$ o salas de $7\times7$).
* Las conexiones y las entradas/salidas entre piezas distintas deben compartir las mismas dimensiones de anchura y altura **en el punto de encuentro**.

### C. Coherencia en Escaleras y Rampas (Eje Vertical)
* Si creáis variaciones de un tramo descendente (escaleras con trampas, pasillos derruidos, etc.), el desplazamiento en los tres ejes ($X, Y, Z$) debe ser matemáticamente **idéntico** en todas las versiones que compartan piscina.
* *Ejemplo:* Si la rampa base avanza 4 bloques y baja 3, la variante rúnica obligatoriamente debe avanzar 4 y bajar 3.

---

## 2. Configuración Perfecta de Bloques Jigsaw

La interfaz física del bloque Jigsaw dentro del juego determina el flujo de la mazmorra. Asegúrate de rellenar los campos según el rol de la pieza:

### A. Bloques Jigsaw de ENTRADA (Techo / Conector Pasivo)
Se colocan en el punto donde la pieza se une a la estructura que ya venía generándose.
* **Name (Nombre):** `vexp:mineshaft_settlement/nombre_conexion` (Identificador único del encaje).
* **Target Name (Nombre del objetivo):** `vexp:mineshaft_settlement/nombre_conexion` (Debe ser idéntico al *Name*).
* **Pool (Piscina):** `minecraft:empty` *(Obligatorio: Las entradas no generan estructuras hacia atrás)*.
* **Turn into (Transformar en):** `minecraft:air` (O el bloque de decoración si queréis que se camufle).
* **Orden de Colocación (Selection Priority):** `0`
* **Orientación de la Flecha 3D:** Mirando **hacia fuera** de la estructura (hacia la pieza anterior).

### B. Bloques Jigsaw de SALIDA (Suelo / Generador Activo o Bucle)
Se colocan al final de la pieza para pedir la siguiente estructura al mapa de piscinas.
* **Name (Nombre):** `vexp:mineshaft_settlement/nombre_conexion`
* **Target Name (Nombre del objetivo):** `vexp:mineshaft_settlement/nombre_conexion`
* **Pool (Piscina):** `vexp:mineshaft_settlement/nombre_de_la_piscina` (Ruta del JSON que debe leer).
* **Turn into (Transformar en):** `minecraft:air`
* **Orden de Colocación (Selection Priority):** `1` *(Utilizar números mayores a 0 de manera equilibrada para evitar rotaciones o bucles invertidos innecesarios).*
* **Orientación de la Flecha 3D:** Mirando **hacia el vacío exterior** (hacia donde continuará la mazmorra).

---

## 3. Plantillas de Formato JSON

A continuación se muestran los dos formatos JSON estándar corregidos para la versión 1.21.1. Todos los archivos deben incluir los namespaces explícitos.

### A. Archivo de Estructura Principal (`data/vexp/worldgen/structure/`)
Define las propiedades globales de spawn de la mazmorra.

```json
{
  "type": "minecraft:jigsaw",
  "start_pool": "vexp:mineshaft_settlement/entrance",
  "size": 10,
  "max_distance_from_center": 128,
  "biomes": "#minecraft:has_structure/mineshaft",
  "step": "surface_structures",
  "terrain_adaptation": "beard_thin",
  "start_height": {
    "absolute": 0
  },
  "use_expansion_hack": false,
  "project_start_to_heightmap": "WORLD_SURFACE_WG"
}
