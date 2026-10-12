#version 330

const float VEXP_CAVE_FOG_ALTITUDE_BOTTOM = -128.0;
const float VEXP_CAVE_FOG_ALTITUDE_TOP = 192.0;
const float VEXP_CAVE_FOG_DISTANCE_START = 12.0;
const float VEXP_CAVE_FOG_DISTANCE_END = 128.0;
const float VEXP_CAVE_FOG_INTENSITY = 0.85;
const float VEXP_CAVE_FOG_DEPTH_RANGE_SCALE = 0.35;
const float VEXP_CAVE_FOG_THICKNESS = 1.0;

float vexp_cave_fog_amount(float cameraHeight, float sphericalDistance, float cylindricalDistance) {
    float caveDepth = 1.0 - smoothstep(VEXP_CAVE_FOG_ALTITUDE_BOTTOM, VEXP_CAVE_FOG_ALTITUDE_TOP, cameraHeight);
    float caveRangeScale = mix(1.0, VEXP_CAVE_FOG_DEPTH_RANGE_SCALE, caveDepth) / max(VEXP_CAVE_FOG_THICKNESS, 0.01);
    float caveDistanceStart = VEXP_CAVE_FOG_DISTANCE_START * caveRangeScale;
    float caveDistanceEnd = max(VEXP_CAVE_FOG_DISTANCE_END * caveRangeScale, caveDistanceStart + 0.001);
    float caveDistance = smoothstep(caveDistanceStart, caveDistanceEnd, max(sphericalDistance, cylindricalDistance));
    return caveDepth * caveDistance * VEXP_CAVE_FOG_INTENSITY;
}
