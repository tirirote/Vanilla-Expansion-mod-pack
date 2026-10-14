#version 330

const bool VEXP_FXAA_ENABLED = true; // Master switch; false leaves the scene untouched.
const float VEXP_FXAA_EDGE_THRESHOLD = 0.125; // Minimum local contrast treated as an edge; lower catches more edges.
const float VEXP_FXAA_EDGE_THRESHOLD_MIN = 0.0625; // Contrast floor in dark areas so shadows are not smoothed.
const float VEXP_FXAA_SUBPIXEL = 0.75; // Subpixel aliasing removal, 0..1; higher softens thin details more.
const float VEXP_FXAA_SPAN_MAX = 8.0; // Maximum blend reach in pixels along an edge.
const float VEXP_FXAA_REDUCE_MUL = 0.125; // Edge direction sensitivity; smaller detects more diagonal edges.
const float VEXP_FXAA_REDUCE_MIN = 0.0078125; // Direction floor on flat areas, keeps noise from steering the blur.

uniform sampler2D SceneSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 SceneSize;
};

in vec2 texCoord;

out vec4 fragColor;

float vexp_luma(vec3 color) {
    return dot(color, vec3(0.299, 0.587, 0.114));
}

void main() {
    vec3 rgbM = texture(SceneSampler, texCoord).rgb;

    if (!VEXP_FXAA_ENABLED) {
        fragColor = vec4(rgbM, 1.0);
        return;
    }

    vec2 texel = 1.0 / OutSize;
    vec3 rgbN = texture(SceneSampler, texCoord + vec2(0.0, -1.0) * texel).rgb;
    vec3 rgbS = texture(SceneSampler, texCoord + vec2(0.0, 1.0) * texel).rgb;
    vec3 rgbW = texture(SceneSampler, texCoord + vec2(-1.0, 0.0) * texel).rgb;
    vec3 rgbE = texture(SceneSampler, texCoord + vec2(1.0, 0.0) * texel).rgb;
    vec3 rgbNW = texture(SceneSampler, texCoord + vec2(-1.0, -1.0) * texel).rgb;
    vec3 rgbNE = texture(SceneSampler, texCoord + vec2(1.0, -1.0) * texel).rgb;
    vec3 rgbSW = texture(SceneSampler, texCoord + vec2(-1.0, 1.0) * texel).rgb;
    vec3 rgbSE = texture(SceneSampler, texCoord + vec2(1.0, 1.0) * texel).rgb;

    float lumaM = vexp_luma(rgbM);
    float lumaN = vexp_luma(rgbN);
    float lumaS = vexp_luma(rgbS);
    float lumaW = vexp_luma(rgbW);
    float lumaE = vexp_luma(rgbE);
    float lumaNW = vexp_luma(rgbNW);
    float lumaNE = vexp_luma(rgbNE);
    float lumaSW = vexp_luma(rgbSW);
    float lumaSE = vexp_luma(rgbSE);

    float lumaMin = min(lumaM, min(min(lumaN, lumaS), min(lumaW, lumaE)));
    float lumaMax = max(lumaM, max(max(lumaN, lumaS), max(lumaW, lumaE)));
    lumaMin = min(lumaMin, min(min(lumaNW, lumaNE), min(lumaSW, lumaSE)));
    lumaMax = max(lumaMax, max(max(lumaNW, lumaNE), max(lumaSW, lumaSE)));
    float lumaRange = lumaMax - lumaMin;

    if (lumaRange < max(VEXP_FXAA_EDGE_THRESHOLD_MIN, lumaMax * VEXP_FXAA_EDGE_THRESHOLD)) {
        fragColor = vec4(rgbM, 1.0);
        return;
    }

    float lumaAvg = (2.0 * (lumaN + lumaS + lumaW + lumaE) + lumaNW + lumaNE + lumaSW + lumaSE) / 12.0;
    float subpixel = clamp(abs(lumaAvg - lumaM) / lumaRange, 0.0, 1.0);
    subpixel = (-2.0 * subpixel + 3.0) * subpixel * subpixel;
    subpixel *= subpixel * clamp(VEXP_FXAA_SUBPIXEL, 0.0, 1.0);

    vec2 dir;
    dir.x = -((lumaNW + lumaNE) - (lumaSW + lumaSE));
    dir.y = ((lumaNW + lumaSW) - (lumaNE + lumaSE));
    float dirReduce = max((lumaNW + lumaNE + lumaSW + lumaSE) * (0.25 * VEXP_FXAA_REDUCE_MUL), VEXP_FXAA_REDUCE_MIN);
    float rcpDirMin = 1.0 / (min(abs(dir.x), abs(dir.y)) + dirReduce);
    dir = clamp(dir * rcpDirMin, vec2(-VEXP_FXAA_SPAN_MAX), vec2(VEXP_FXAA_SPAN_MAX)) * texel;

    vec3 rgbA = 0.5 * (
        texture(SceneSampler, texCoord + dir * (1.0 / 3.0 - 0.5)).rgb +
        texture(SceneSampler, texCoord + dir * (2.0 / 3.0 - 0.5)).rgb
    );
    vec3 rgbB = rgbA * 0.5 + 0.25 * (
        texture(SceneSampler, texCoord - dir * 0.5).rgb +
        texture(SceneSampler, texCoord + dir * 0.5).rgb
    );
    float lumaB = vexp_luma(rgbB);
    vec3 edgeColor = (lumaB < lumaMin || lumaB > lumaMax) ? rgbA : rgbB;

    vec3 neighborhood = (rgbM + rgbN + rgbS + rgbW + rgbE + rgbNW + rgbNE + rgbSW + rgbSE) / 9.0;
    fragColor = vec4(mix(edgeColor, neighborhood, subpixel), 1.0);
}
