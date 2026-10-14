#version 330

const bool VEXP_PIXELATE_ENABLED = false; // Master switch; false leaves the scene untouched.
const float VEXP_PIXELATE_BLOCK_SIZE = 2.0; // Block size in screen pixels; 1 is no pixelation.
const int VEXP_PIXELATE_COLOR_LEVELS = 0; // Shades per channel after quantizing; 0 keeps full color, 4 to 16 is retro.
const float VEXP_PIXELATE_DITHER = 0.0; // Ordered dither on quantized colors, 0..1; needs color levels above 0.
const float VEXP_PIXELATE_MIX = 1.0; // Blend with the original image; 0 is off, 1 is the full effect.

const float VEXP_BAYER_4X4[16] = float[16](
    0.0, 8.0, 2.0, 10.0,
    12.0, 4.0, 14.0, 6.0,
    3.0, 11.0, 1.0, 9.0,
    15.0, 7.0, 13.0, 5.0
);

uniform sampler2D SceneSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 SceneSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec3 scene = texture(SceneSampler, texCoord).rgb;

    if (!VEXP_PIXELATE_ENABLED) {
        fragColor = vec4(scene, 1.0);
        return;
    }

    float block = max(VEXP_PIXELATE_BLOCK_SIZE, 1.0);
    vec2 cell = floor(gl_FragCoord.xy / block);
    vec2 blockCenter = clamp((cell + 0.5) * block / OutSize, vec2(0.0), vec2(1.0));
    vec3 pixelated = texture(SceneSampler, blockCenter).rgb;

    float levels = float(VEXP_PIXELATE_COLOR_LEVELS);
    if (levels >= 2.0) {
        int bayerIndex = int(mod(cell.x, 4.0)) + int(mod(cell.y, 4.0)) * 4;
        float dither = (VEXP_BAYER_4X4[bayerIndex] + 0.5) / 16.0 - 0.5;
        float steps = levels - 1.0;
        pixelated = floor(pixelated * steps + 0.5 + dither * VEXP_PIXELATE_DITHER) / steps;
    }

    fragColor = vec4(mix(scene, pixelated, clamp(VEXP_PIXELATE_MIX, 0.0, 1.0)), 1.0);
}
