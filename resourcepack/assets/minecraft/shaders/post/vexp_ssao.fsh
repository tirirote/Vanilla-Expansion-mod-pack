#version 330

#moj_import <minecraft:vexp_screen_space.glsl>

const bool VEXP_SSAO_ENABLED = true; // Master switch; false disables occlusion.
const float VEXP_SSAO_RADIUS = 0.5; // Search radius in blocks; larger darkens wider corners.
const float VEXP_SSAO_BIAS = 0.05; // Depth tolerance in blocks against self-shadowing.
const float VEXP_SSAO_INTENSITY = 0.35; // Occlusion strength, 0..1; 0 disables the darkening.
const float VEXP_SSAO_POWER = 2.0; // Occlusion curve; above 1 darkens only the deepest corners.
const float VEXP_SSAO_FADE_START = 24.0; // Distance in blocks where occlusion starts fading out.
const float VEXP_SSAO_FADE_END = 96.0; // Distance in blocks where occlusion is gone.
const int VEXP_SSAO_SAMPLES = 24; // Hemisphere samples per pixel; fixed at compile time.

uniform sampler2D MainDepthSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 MainDepthSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main() {
    if (!VEXP_SSAO_ENABLED || vexp_ss_is_sky(texture(MainDepthSampler, texCoord).r)) {
        fragColor = vec4(1.0);
        return;
    }

    float aspect = OutSize.x / OutSize.y;
    vec2 texel = 1.0 / OutSize;
    vec3 pos = vexp_ss_position_at(MainDepthSampler, texCoord, aspect);
    vec3 normal = vexp_ss_view_normal(MainDepthSampler, texCoord, texel, aspect);

    float rotation = vexp_ss_hash(gl_FragCoord.xy) * 6.2831853;
    vec3 up = abs(normal.y) < 0.99 ? vec3(0.0, 1.0, 0.0) : vec3(1.0, 0.0, 0.0);
    vec3 tangent0 = normalize(cross(up, normal));
    vec3 tangent = tangent0 * cos(rotation) + cross(normal, tangent0) * sin(rotation);
    vec3 bitangent = cross(normal, tangent);

    const float GOLDEN_ANGLE = 2.3999632;
    float sampleCount = float(VEXP_SSAO_SAMPLES);
    float occluded = 0.0;
    for (int i = 0; i < VEXP_SSAO_SAMPLES; ++i) {
        float fi = float(i) + 0.5;
        float cosT = 1.0 - fi / sampleCount;
        float sinT = sqrt(max(1.0 - cosT * cosT, 0.0));
        float phi = fi * GOLDEN_ANGLE;
        vec3 kernel = vec3(cos(phi) * sinT, sin(phi) * sinT, cosT);
        float radiusScale = mix(0.1, 1.0, (fi / sampleCount) * (fi / sampleCount));
        vec3 samplePos = pos + (tangent * kernel.x + bitangent * kernel.y + normal * kernel.z) * VEXP_SSAO_RADIUS * radiusScale;
        if (samplePos.z <= VEXP_SS_NEAR_PLANE) {
            continue;
        }
        vec2 sampleUv = vexp_ss_project(samplePos, aspect);
        if (any(lessThan(sampleUv, vec2(0.0))) || any(greaterThan(sampleUv, vec2(1.0)))) {
            continue;
        }
        float sceneZ = vexp_ss_linear_depth(textureLod(MainDepthSampler, sampleUv, 0.0).r);
        float rangeCheck = smoothstep(0.0, 1.0, VEXP_SSAO_RADIUS / max(abs(pos.z - sceneZ), 1e-4));
        occluded += step(sceneZ + VEXP_SSAO_BIAS, samplePos.z) * rangeCheck;
    }

    float ao = pow(clamp(1.0 - occluded / sampleCount, 0.0, 1.0), max(VEXP_SSAO_POWER, 0.01));
    float fade = 1.0 - smoothstep(VEXP_SSAO_FADE_START, VEXP_SSAO_FADE_END, pos.z);
    float occlusion = mix(1.0, ao, clamp(VEXP_SSAO_INTENSITY, 0.0, 1.0) * fade);
    fragColor = vec4(vec3(occlusion), 1.0);
}
