#version 330

#moj_import <minecraft:vexp_screen_space.glsl>

const int VEXP_SSAO_BLUR_RADIUS = 2; // Blur half-width in pixels; fixed at compile time, 2 is a 5x5 kernel.
const float VEXP_SSAO_BLUR_EDGE_SHARPNESS = 40.0; // Depth-edge sensitivity; higher stops the blur sooner at depth jumps.

uniform sampler2D InSampler;
uniform sampler2D MainDepthSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
    vec2 MainDepthSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec2 texel = 1.0 / OutSize;
    float centerZ = vexp_ss_linear_depth(textureLod(MainDepthSampler, texCoord, 0.0).r);

    float sum = 0.0;
    float total = 0.0;
    for (int y = -VEXP_SSAO_BLUR_RADIUS; y <= VEXP_SSAO_BLUR_RADIUS; ++y) {
        for (int x = -VEXP_SSAO_BLUR_RADIUS; x <= VEXP_SSAO_BLUR_RADIUS; ++x) {
            vec2 uv = texCoord + vec2(float(x), float(y)) * texel;
            float sampleZ = vexp_ss_linear_depth(textureLod(MainDepthSampler, uv, 0.0).r);
            float diff = abs(sampleZ - centerZ) / max(centerZ, 1e-3);
            float weight = exp(-diff * VEXP_SSAO_BLUR_EDGE_SHARPNESS);
            sum += textureLod(InSampler, uv, 0.0).r * weight;
            total += weight;
        }
    }

    fragColor = vec4(vec3(sum / max(total, 1e-6)), 1.0);
}
