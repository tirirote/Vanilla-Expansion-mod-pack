#version 330

#moj_import <minecraft:vexp_bloom.glsl>

uniform sampler2D SceneSampler;
uniform sampler2D BloomSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 SceneSize;
    vec2 BloomSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec3 scene = texture(SceneSampler, texCoord).rgb;

    if (!VEXP_BLOOM_ENABLED) {
        fragColor = vec4(scene, 1.0);
        return;
    }

    vec3 bloom = vexp_bloom_shape(texture(BloomSampler, texCoord).rgb);

    if (VEXP_BLOOM_DEBUG) {
        fragColor = vec4(bloom, 1.0);
        return;
    }

    vec3 result = VEXP_BLOOM_MODE == 1
        ? 1.0 - (1.0 - scene) * (1.0 - clamp(bloom, 0.0, 1.0))
        : scene + bloom;
    fragColor = vec4(result, 1.0);
}
