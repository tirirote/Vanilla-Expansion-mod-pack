#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>
#moj_import <minecraft:vexp_color_profile.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out float vexpIsUiPass;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    vec3 pos = Position + ModelOffset;
    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);
    vexpIsUiPass = step(0.99, abs(ProjMat[3][3]));

    sphericalVertexDistance = fog_spherical_distance(pos);
    cylindricalVertexDistance = fog_cylindrical_distance(pos);
    vec4 lightmapColor = sample_lightmap(Sampler2, UV2);
    if (vexpIsUiPass < 0.5) {
        lightmapColor = vexp_apply_shadow_profile(lightmapColor);
    }
    vertexColor = Color * lightmapColor;
    texCoord0 = UV0;
}
