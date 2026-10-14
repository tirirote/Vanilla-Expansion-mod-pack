#version 330

const bool VEXP_OUTLINE_ENABLED = true; // Master switch; false returns the scene untouched.
const int VEXP_OUTLINE_MODE = 1; // 0=multiply (tints toward the line color), 1=add (adds the line color).

const float VEXP_OUTLINE_THICKNESS = 1.0; // Line width in screen pixels.

const vec3 VEXP_OUTLINE_COLOR = vec3(0.6, 0.55, 0.25); // Line color; black with multiply gives dark lines.
const float VEXP_OUTLINE_STRENGTH = 0.3; // Line opacity, 0..1.
const float VEXP_OUTLINE_CONTRAST = 1.0; // Edge-mask contrast around 0.5; above 1 is crisper, below 1 softer.

const bool VEXP_OUTLINE_ONE_SIDED = true; // Draws only on the nearer surface; false draws on both sides.
const float VEXP_OUTLINE_THRESHOLD = 0.01; // Depth jump, as a fraction of distance, where an edge starts.
const float VEXP_OUTLINE_SOFTNESS = 0.3; // Width of the threshold ramp; smaller is a harder edge.
const float VEXP_OUTLINE_MAX_DISTANCE = 64.0; // Distance in blocks where lines are fully faded out.
const float VEXP_OUTLINE_FADE_RANGE = 64.0; // Blocks over which lines fade before the max distance; set equal to the max for a fade from the camera.
const float VEXP_OUTLINE_FADE_CURVE = 1.25; // Fade shape: 1=smooth S-curve, above 1 fades faster early, below 1 holds strength longer.
const float VEXP_OUTLINE_NEAR_PLANE = 0.05; // Camera near plane used to linearize depth.
const bool VEXP_OUTLINE_REVERSED_DEPTH = false; // Set true on 26.2+ where the depth buffer is reversed.

const bool VEXP_OUTLINE_COLOR_ENABLED = true; // Adds lines where the lit scene changes color or brightness on the same surface.
const int VEXP_OUTLINE_COLOR_SOURCE = 0; // 0=color distance (RGB), 1=luminance only (light and shadow edges).
const float VEXP_OUTLINE_COLOR_THRESHOLD = 0.05; // Scene difference where a color line starts; raise it to drop texture detail.
const float VEXP_OUTLINE_COLOR_SOFTNESS = 0.3; // Width of the color threshold ramp; smaller is harder.
const float VEXP_OUTLINE_COLOR_STRENGTH = 1.0; // Color-line weight against depth lines, 0..1.
const float VEXP_OUTLINE_COLOR_DEPTH_GATE = 0.01; // Color lines are skipped across depth jumps above this fraction.

const bool VEXP_OUTLINE_DEBUG_MODE = false; // Shows the outline mask as white on black.
const int VEXP_OUTLINE_DEBUG_VIEW = 2; // With debug on: 0=final, 1=depth mask, 2=color mask.

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
    float standardDepth = VEXP_OUTLINE_REVERSED_DEPTH ? 1.0 - depth : depth;
    return VEXP_OUTLINE_NEAR_PLANE / max(1.0 - standardDepth, 1e-6);
}

float vexp_scene_difference(vec3 a, vec3 b) {
    if (VEXP_OUTLINE_COLOR_SOURCE == 1) {
        const vec3 luma = vec3(0.2126, 0.7152, 0.0722);
        return abs(dot(a, luma) - dot(b, luma));
    }
    return distance(a, b);
}

float vexp_edge_mask(float edge, float threshold, float softness) {
    float mask = smoothstep(threshold, threshold + max(softness, 0.0001), edge);
    return clamp((mask - 0.5) * VEXP_OUTLINE_CONTRAST + 0.5, 0.0, 1.0);
}

void main() {
    vec3 scene = texture(SceneSampler, texCoord).rgb;

    if (!VEXP_OUTLINE_ENABLED) {
        fragColor = vec4(scene, 1.0);
        return;
    }

    vec2 pixelStep = max(VEXP_OUTLINE_THICKNESS, 0.0) / OutSize;
    float centerDepth = vexp_view_depth(texCoord);

    vec2 offsets[4] = vec2[](
        vec2(pixelStep.x, 0.0),
        vec2(-pixelStep.x, 0.0),
        vec2(0.0, pixelStep.y),
        vec2(0.0, -pixelStep.y)
    );

    float edge = 0.0;
    float colorEdge = 0.0;
    float nearestDepth = centerDepth;
    for (int i = 0; i < 4; ++i) {
        vec2 neighborUv = texCoord + offsets[i];
        float neighborDepth = vexp_view_depth(neighborUv);
        float jump = VEXP_OUTLINE_ONE_SIDED
            ? (neighborDepth - centerDepth) / centerDepth
            : abs(neighborDepth - centerDepth) / min(neighborDepth, centerDepth);
        edge = max(edge, jump);
        nearestDepth = min(nearestDepth, neighborDepth);

        float absoluteJump = abs(neighborDepth - centerDepth) / min(neighborDepth, centerDepth);
        if (VEXP_OUTLINE_COLOR_ENABLED && absoluteJump < VEXP_OUTLINE_COLOR_DEPTH_GATE) {
            colorEdge = max(colorEdge, vexp_scene_difference(scene, texture(SceneSampler, neighborUv).rgb));
        }
    }

    float depthMask = vexp_edge_mask(edge, VEXP_OUTLINE_THRESHOLD, VEXP_OUTLINE_SOFTNESS);
    float colorMask = vexp_edge_mask(colorEdge, VEXP_OUTLINE_COLOR_THRESHOLD, VEXP_OUTLINE_COLOR_SOFTNESS);
    colorMask *= clamp(VEXP_OUTLINE_COLOR_STRENGTH, 0.0, 1.0);
    float mask = max(depthMask, colorMask);

    float fadeT = clamp((VEXP_OUTLINE_MAX_DISTANCE - nearestDepth) / max(VEXP_OUTLINE_FADE_RANGE, 0.001), 0.0, 1.0);
    float distanceFade = pow(fadeT * fadeT * fadeT * (fadeT * (fadeT * 6.0 - 15.0) + 10.0), max(VEXP_OUTLINE_FADE_CURVE, 0.01));
    float strength = clamp(VEXP_OUTLINE_STRENGTH, 0.0, 1.0);
    mask *= distanceFade * strength;

    if (VEXP_OUTLINE_DEBUG_MODE) {
        vec3 debugColor = vec3(mask);
        if (VEXP_OUTLINE_DEBUG_VIEW == 1) {
            debugColor = vec3(depthMask * distanceFade);
        } else if (VEXP_OUTLINE_DEBUG_VIEW == 2) {
            debugColor = vec3(colorMask * distanceFade);
        }
        fragColor = vec4(debugColor, 1.0);
        return;
    }

    vec3 result = VEXP_OUTLINE_MODE == 1
        ? scene + VEXP_OUTLINE_COLOR * mask
        : scene * mix(vec3(1.0), VEXP_OUTLINE_COLOR, mask);

    fragColor = vec4(result, 1.0);
}
