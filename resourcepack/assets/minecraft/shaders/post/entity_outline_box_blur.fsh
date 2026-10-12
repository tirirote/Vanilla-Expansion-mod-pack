#version 330

const float VEXP_OUTLINE_BLOOM_RADIUS = 6.0;
const float VEXP_OUTLINE_BLOOM_STRENGTH = 1.0;

layout(std140) uniform SamplerInfo {
        float radius = VEXP_OUTLINE_BLOOM_RADIUS;
    vec2 OutSize;
    vec2 InSize;
};

layout(std140) uniform BlurConfig {
    vec2 BlurDir;
    float Radius;
};

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec2 oneTexel = 1.0 / InSize;
    vec2 sampleStep = oneTexel * BlurDir;

    vec4 blurred = vec4(0.0);
    float radius = 2.0;
    for (float a = -radius + 0.5; a <= radius; a += 2.0) {
        blurred += texture(InSampler, texCoord + sampleStep * a);
    }
    blurred += texture(InSampler, texCoord + sampleStep * radius) / 2.0;
    vec4 bloom = blurred / (radius + 0.5);
    bloom.a = clamp(bloom.a * VEXP_OUTLINE_BLOOM_STRENGTH, 0.0, 1.0);
    fragColor = bloom;
}
