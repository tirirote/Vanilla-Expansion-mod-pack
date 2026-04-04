#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

const float VEXP_DEFAULT_ALPHA_CUTOUT = 0.2;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    float alphaCutout = VEXP_DEFAULT_ALPHA_CUTOUT;
#ifdef ALPHA_CUTOUT
    alphaCutout = max(alphaCutout, ALPHA_CUTOUT);
#endif
    if (color.a < alphaCutout) {
        discard;
    }
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
