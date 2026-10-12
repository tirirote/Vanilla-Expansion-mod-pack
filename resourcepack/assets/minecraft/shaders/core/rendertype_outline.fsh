#version 330

#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    if (color.a == 0.0) {
        discard;
    }
    vec3 outlineColor = mix(ColorModulator.rgb, vec3(0.30, 0.88, 0.78), 0.28);
    fragColor = vec4(outlineColor * vertexColor.rgb, ColorModulator.a);
}
