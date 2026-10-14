const float VEXP_SS_NEAR_PLANE = 0.05; // Camera near plane used to linearize depth.
const float VEXP_SS_TAN_HALF_FOV = 0.7002; // tan(vertical FOV / 2); 0.7002 is 70 degrees and must match the game FOV.
const bool VEXP_SS_REVERSED_DEPTH = false; // Set true on 26.2+ where the depth buffer is reversed.
const float VEXP_SS_FAR_LIMIT = 256.0; // Blocks treated as infinity; sky clamps to this.

float vexp_ss_standard_depth(float depth) {
    return VEXP_SS_REVERSED_DEPTH ? 1.0 - depth : depth;
}

bool vexp_ss_is_sky(float depth) {
    return vexp_ss_standard_depth(depth) >= 0.99999;
}

float vexp_ss_linear_depth(float depth) {
    return min(VEXP_SS_NEAR_PLANE / max(1.0 - vexp_ss_standard_depth(depth), 1e-6), VEXP_SS_FAR_LIMIT);
}

vec2 vexp_ss_tan_half(float aspect) {
    return vec2(VEXP_SS_TAN_HALF_FOV * aspect, VEXP_SS_TAN_HALF_FOV);
}

vec3 vexp_ss_view_position(vec2 uv, float linearZ, float aspect) {
    return vec3((uv * 2.0 - 1.0) * vexp_ss_tan_half(aspect) * linearZ, linearZ);
}

vec2 vexp_ss_project(vec3 viewPos, float aspect) {
    return (viewPos.xy / (viewPos.z * vexp_ss_tan_half(aspect))) * 0.5 + 0.5;
}

vec3 vexp_ss_position_at(sampler2D depthSampler, vec2 uv, float aspect) {
    return vexp_ss_view_position(uv, vexp_ss_linear_depth(textureLod(depthSampler, uv, 0.0).r), aspect);
}

vec3 vexp_ss_view_normal(sampler2D depthSampler, vec2 uv, vec2 texel, float aspect) {
    vec3 c = vexp_ss_position_at(depthSampler, uv, aspect);
    vec3 r = vexp_ss_position_at(depthSampler, uv + vec2(texel.x, 0.0), aspect);
    vec3 l = vexp_ss_position_at(depthSampler, uv - vec2(texel.x, 0.0), aspect);
    vec3 t = vexp_ss_position_at(depthSampler, uv + vec2(0.0, texel.y), aspect);
    vec3 b = vexp_ss_position_at(depthSampler, uv - vec2(0.0, texel.y), aspect);
    vec3 dx = abs(r.z - c.z) < abs(l.z - c.z) ? r - c : c - l;
    vec3 dy = abs(t.z - c.z) < abs(b.z - c.z) ? t - c : c - b;
    return normalize(cross(dy, dx));
}

float vexp_ss_hash(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}
