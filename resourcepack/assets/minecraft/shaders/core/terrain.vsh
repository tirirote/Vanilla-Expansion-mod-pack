#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:chunksection.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>

const float VEXP_WAVE_SPEED = 0.3;
const float VEXP_WAVE_AMP_X = 0.03;
const float VEXP_WAVE_AMP_Z = 0.03;
const float VEXP_WAVE_RANDOM_PHASE = 6.2831853;

const vec3 VEXP_WAVE_MARKER_COLOR = vec3(1.0, 0.0, 1.0);
const float VEXP_WAVE_MARKER_TOLERANCE = 0.08;
const bool VEXP_WAVE_GREEN_FALLBACK = false;

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;
uniform sampler2D Sampler0;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
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
    vertexColor = Color * sample_lightmap(Sampler2, UV2);
    texCoord0 = UV0;
}
