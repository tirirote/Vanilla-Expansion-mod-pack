#version 330

#moj_import <minecraft:light.glsl>
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out float vexpIsUiPass;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    vexpIsUiPass = step(0.99, abs(ProjMat[3][3]));

    vec3 viewPosition = (ModelViewMat * vec4(Position, 1.0)).xyz;
    sphericalVertexDistance = fog_spherical_distance(viewPosition);
    cylindricalVertexDistance = fog_cylindrical_distance(viewPosition);

    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * sample_lightmap(Sampler2, UV2);

    texCoord0 = UV0;
}
