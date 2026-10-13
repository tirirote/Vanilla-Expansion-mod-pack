#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:chunksection.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>
#moj_import <minecraft:vexp_color_profile.glsl>

const float VEXP_WAVE_SPEED = 0.3; // Wind cycles per normalized world-time unit.
const float VEXP_WAVE_AMP_X = 0.03; // Maximum horizontal displacement on X, in blocks.
const float VEXP_WAVE_AMP_Z = 0.03; // Maximum horizontal displacement on Z, in blocks.
const float VEXP_WAVE_RANDOM_PHASE = 6.2831853; // Maximum per-block phase offset, in radians.

const vec3 VEXP_WAVE_MARKER_COLOR = vec3(1.0, 0.0, 1.0); // Transparent texture-corner marker RGB.
const float VEXP_WAVE_MARKER_TOLERANCE = 0.08; // RGB distance allowed when matching the marker.
const bool VEXP_WAVE_GREEN_FALLBACK = false; // Also wave green-dominant vertices when enabled.

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;
uniform sampler2D Sampler0;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
out vec4 vexpTerrainDebugColor;
out float vexpTerrainAOMask;
out float vexpTerrainColorShadowMask;
out vec4 vexpTerrainDebugLight;
out vec4 vexpTerrainDebugRawLightmap;
out float vexpTerrainDebugSkyLight;
out float vexpTerrainDebugBlockLight;
out vec2 texCoord0;

float vexp_wave_texture_marker(vec2 uv) {
    ivec2 atlasSize = textureSize(Sampler0, 0);
    ivec2 atlasPixel = clamp(ivec2(floor(uv * vec2(atlasSize))), ivec2(0), atlasSize - ivec2(1));
    vec4 markerPixel = texelFetch(Sampler0, atlasPixel, 0);
    float transparentPixel = 1.0 - step(0.05, markerPixel.a);
    float markerColorMatch = step(distance(markerPixel.rgb, VEXP_WAVE_MARKER_COLOR), VEXP_WAVE_MARKER_TOLERANCE);
    return transparentPixel * markerColorMatch;
}

float vexp_wave_random_phase(vec2 worldXZ) {
    vec2 blockCell = floor(worldXZ);
    float randomValue = fract(sin(dot(blockCell, vec2(127.1, 311.7))) * 43758.5453);
    return randomValue * VEXP_WAVE_RANDOM_PHASE;
}

void main() {
    vec3 worldPosition = Position + vec3(ChunkPosition);
    vec3 pos = worldPosition - vec3(CameraBlockPos) + CameraOffset;

    float foliageMask = vexp_wave_texture_marker(UV0);
    if (VEXP_WAVE_GREEN_FALLBACK) {
        foliageMask = max(foliageMask, smoothstep(0.30, 0.95, (Color.g * 0.95) - min(Color.r, Color.b)));
    }
    float windPhase = GameTime * 24000.0 * VEXP_WAVE_SPEED + dot(mod(worldPosition.xz, vec2(256.0)), vec2(0.06, 0.09)) + vexp_wave_random_phase(worldPosition.xz);
    pos.x += sin(windPhase) * VEXP_WAVE_AMP_X * foliageMask;
    pos.z += cos(windPhase * 0.6) * VEXP_WAVE_AMP_Z * foliageMask;
    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    sphericalVertexDistance = fog_spherical_distance(pos);
    cylindricalVertexDistance = fog_cylindrical_distance(pos);
    float skyLightLevel = float(UV2.y) / 240.0;
    float blockLightLevel = float(UV2.x) / 240.0;
    vec4 terrainLightmap = sample_lightmap(Sampler2, UV2);
    vec4 terrainShadowProfile = vexp_apply_terrain_shadow_profile(terrainLightmap, skyLightLevel, blockLightLevel);
    vexpTerrainDebugColor = Color;
    vexpTerrainAOMask = vexp_terrain_ao_mask(Color.rgb);
    vexpTerrainColorShadowMask = vexp_terrain_color_shadow_mask(Color.rgb);
    vexpTerrainDebugLight = terrainShadowProfile;
    vexpTerrainDebugRawLightmap = sample_lightmap(Sampler2, UV2);
    vexpTerrainDebugSkyLight = skyLightLevel;
    vexpTerrainDebugBlockLight = blockLightLevel;
    if (VEXP_LIGHTMAP_DEBUG_MODE) {
        vertexColor = terrainShadowProfile;
    } else {
        terrainLightmap = vexp_apply_terrain_sky_light(terrainShadowProfile, skyLightLevel, blockLightLevel, GameTime);
        vec3 shadedTerrainColor = vexp_apply_terrain_color_shading(Color.rgb, vexpTerrainColorShadowMask);
        vec3 terrainColor = vexp_apply_terrain_ao(shadedTerrainColor, vexpTerrainAOMask);
        vertexColor = vec4(terrainColor, Color.a) * terrainLightmap;
    }
    texCoord0 = UV0;
}
