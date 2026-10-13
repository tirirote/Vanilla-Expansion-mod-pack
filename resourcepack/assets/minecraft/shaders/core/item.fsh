#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:vexp_cave_fog.glsl>
#moj_import <minecraft:vexp_color_profile.glsl>

const bool VEXP_DEBUG_UI_PASS = false; // Replaces output with UI/world pass colors for diagnosis.

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in float vexpIsUiPass;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif

    color *= vertexColor * ColorModulator;
    if (vexpIsUiPass < 0.5) {
        color.rgb = vexp_apply_color_profile(color.rgb, GameTime);
        color = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
        float caveFog = vexp_cave_fog_amount(float(CameraBlockPos.y), sphericalVertexDistance, cylindricalVertexDistance);
        color.rgb = mix(color.rgb, FogColor.rgb, caveFog);
    }
    if (VEXP_DEBUG_UI_PASS) {
        fragColor = vexpIsUiPass < 0.5 ? vec4(0.0, 1.0, 0.0, 1.0) : vec4(1.0, 1.0, 0.0, 1.0);
        return;
    }
    fragColor = color;
}
