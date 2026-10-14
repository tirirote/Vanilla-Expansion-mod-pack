#version 330

#moj_import <minecraft:vexp_bloom.glsl>

uniform sampler2D InSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main() {
    fragColor = vec4(vexp_bloom_blur(InSampler, texCoord, vec2(0.0, 1.0), OutSize), 1.0);
}
