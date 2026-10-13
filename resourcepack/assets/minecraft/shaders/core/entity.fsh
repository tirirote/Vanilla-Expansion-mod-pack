#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:vexp_cave_fog.glsl>
#moj_import <minecraft:vexp_color_profile.glsl>

const bool VEXP_DEBUG_UI_PASS = false; // Replaces output with UI/world pass colors for diagnosis.

uniform sampler2D Sampler0;

#ifdef DISSOLVE
uniform sampler2D DissolveMaskSampler;
#endif

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in float vexpIsUiPass;
#ifdef PER_FACE_LIGHTING
in vec4 vertexPerFaceColorBack;
in vec4 vertexPerFaceColorFront;
#else
in vec4 vertexColor;
#endif

#ifndef EMISSIVE
in vec4 lightMapColor;
#endif

#ifndef NO_OVERLAY
in vec4 overlayColor;
#endif

in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif

#ifdef PER_FACE_LIGHTING
    vec4 faceVertexColor = gl_FrontFacing ? vertexPerFaceColorFront : vertexPerFaceColorBack;
#else
    vec4 faceVertexColor = vertexColor;
#endif

#ifdef DISSOLVE
    if (faceVertexColor.a < texture(DissolveMaskSampler, texCoord0).a) {
        discard;
    }
    // The dissolve effect entirely replaces translucency
    faceVertexColor.a = 1.0;
#endif

    color *= faceVertexColor * ColorModulator;
#ifndef NO_OVERLAY
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
#endif
#ifndef EMISSIVE
    color *= lightMapColor;
#endif

 #ifndef EMISSIVE
     if (vexpIsUiPass < 0.5) {
         color.rgb = vexp_apply_color_profile(color.rgb, GameTime);
     }
 #endif
     if (vexpIsUiPass < 0.5) {
         color = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
         float caveFog = vexp_cave_fog_amount(float(CameraBlockPos.y), sphericalVertexDistance, cylindricalVertexDistance);
         color.rgb = mix(color.rgb, FogColor.rgb, caveFog);
     }
     if (VEXP_DEBUG_UI_PASS) {
         fragColor = vexpIsUiPass < 0.5 ? vec4(0.0, 1.0, 1.0, 1.0) : vec4(1.0, 0.0, 1.0, 1.0);
         return;
     }
     fragColor = color;
}
