#version 330

const bool VEXP_DOF_ENABLED = false; // Master switch; false leaves the scene untouched.
const bool VEXP_DOF_DEBUG = false; // Shows the blur amount as grayscale; white is fully blurred.

const int VEXP_DOF_FOCUS_MODE = 0; // Focus source: 0=fixed distance, 1=depth read at the focus point.
const float VEXP_DOF_FOCUS_DISTANCE = 16.0; // Focus distance in blocks; used in mode 0.
const vec2 VEXP_DOF_FOCUS_POINT = vec2(0.5, 0.5); // Screen position read in mode 1, 0..1 on each axis.

const float VEXP_DOF_SHARP_RANGE = 16.0; // Blocks on each side of focus that stay sharp.
const float VEXP_DOF_FALLOFF = 16.0; // Blocks past the sharp range over which blur reaches full strength.
const float VEXP_DOF_NEAR_BIAS = 0.1; // Blur multiplier in front of focus; 0 keeps everything closer than focus sharp.
const float VEXP_DOF_FAR_BIAS = 0.5; // Blur multiplier behind focus; above 1 blurs the background harder.
const float VEXP_DOF_RADIUS = 8.0; // Largest blur radius in screen pixels, before the biases.

const float VEXP_DOF_FAR_LIMIT = 256.0; // Blocks treated as infinity; sky and distant terrain clamp to this.
const float VEXP_DOF_NEAR_PLANE = 0.05; // Camera near plane used to linearize depth.
const bool VEXP_DOF_REVERSED_DEPTH = false; // Set true on 26.2+ where the depth buffer is reversed.
const int VEXP_DOF_TAPS = 24; // Gather samples per pixel; fixed at compile time, higher is smoother and slower.

uniform sampler2D SceneSampler;
uniform sampler2D MainDepthSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 SceneSize;
    vec2 MainDepthSize;
};

in vec2 texCoord;

out vec4 fragColor;

float vexp_view_depth(vec2 uv) {
    float depth = texture(MainDepthSampler, uv).r;
    float standardDepth = VEXP_DOF_REVERSED_DEPTH ? 1.0 - depth : depth;
    return min(VEXP_DOF_NEAR_PLANE / max(1.0 - standardDepth, 1e-6), VEXP_DOF_FAR_LIMIT);
}

float vexp_blur_radius(float depth, float focus) {
    float delta = depth - focus;
    float side = delta < 0.0 ? VEXP_DOF_NEAR_BIAS : VEXP_DOF_FAR_BIAS;
    float t = clamp((abs(delta) - VEXP_DOF_SHARP_RANGE) / max(VEXP_DOF_FALLOFF, 0.001), 0.0, 1.0);
    return t * max(side, 0.0) * max(VEXP_DOF_RADIUS, 0.0);
}

void main() {
    vec3 scene = texture(SceneSampler, texCoord).rgb;

    if (!VEXP_DOF_ENABLED) {
        fragColor = vec4(scene, 1.0);
        return;
    }

    float focus = VEXP_DOF_FOCUS_MODE == 1
        ? vexp_view_depth(VEXP_DOF_FOCUS_POINT)
        : VEXP_DOF_FOCUS_DISTANCE;
    float centerRadius = vexp_blur_radius(vexp_view_depth(texCoord), focus);

    if (VEXP_DOF_DEBUG) {
        fragColor = vec4(vec3(clamp(centerRadius / max(VEXP_DOF_RADIUS, 0.001), 0.0, 1.0)), 1.0);
        return;
    }

    if (centerRadius < 0.5) {
        fragColor = vec4(scene, 1.0);
        return;
    }

    const float GOLDEN_ANGLE = 2.3999632;
    float noise = fract(52.9829189 * fract(dot(gl_FragCoord.xy, vec2(0.06711056, 0.00583715))));
    float angleOffset = noise * 6.2831853;

    vec3 sum = scene;
    float totalWeight = 1.0;
    for (int i = 0; i < VEXP_DOF_TAPS; ++i) {
        float fi = float(i) + 0.5;
        float r = sqrt(fi / float(VEXP_DOF_TAPS));
        float theta = fi * GOLDEN_ANGLE + angleOffset;
        float tapDistance = r * centerRadius;
        vec2 tapUv = texCoord + vec2(cos(theta), sin(theta)) * tapDistance / OutSize;

        float tapRadius = vexp_blur_radius(vexp_view_depth(tapUv), focus);
        float weight = clamp(tapRadius - tapDistance + 1.0, 0.0, 1.0);
        sum += texture(SceneSampler, tapUv).rgb * weight;
        totalWeight += weight;
    }

    fragColor = vec4(sum / totalWeight, 1.0);
}
