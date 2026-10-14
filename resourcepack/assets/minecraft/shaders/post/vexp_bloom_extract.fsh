#version 330

#moj_import <minecraft:vexp_bloom.glsl>

uniform sampler2D SceneSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 SceneSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main() {
    fragColor = vec4(vexp_bloom_extract(texture(SceneSampler, texCoord).rgb), 1.0);
}
