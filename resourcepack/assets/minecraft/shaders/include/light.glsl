#version 330

const float VEXP_DIRECTIONAL_LIGHT_STRENGTH = 0.6; // Normal-based light contribution, 0 disables it.
const float VEXP_AMBIENT_LIGHT_STRENGTH = 0.4; // Minimum fill light on faces turned away from lights.
const float VEXP_DIRECTIONAL_LIGHT_HARDNESS = 1.0; // Curve of the normal/light response; 1 is linear.
const float VEXP_LIGHTING_CONTRAST = 1.0; // Contrast around light value 0.5; 1 preserves the input curve.
const vec3 VEXP_DIRECTIONAL_LIGHT_COLOR = vec3(0.85, 0.75, 1.0); // Color multiplier for directional light.
const vec3 VEXP_AMBIENT_LIGHT_COLOR = vec3(0.96, 0.86, 0.76); // Color multiplier for ambient fill.

const float VEXP_LIGHTING_BRIGHTNESS = 1.0; // Final light multiplier; 1 is neutral.
const float VEXP_LIGHTING_CONTRAST_PIVOT = 0.35; // Light value that contrast leaves unchanged, 0..1.
const float VEXP_LIGHTING_THRESHOLD = 0.5; // Light luminance separating shadow mask from lit mask, 0..1.
const float VEXP_LIGHTING_SOFTNESS = 0.45; // Width of the shadow/light transition; smaller is a harder edge.
const float VEXP_LIGHTING_MASK_HARDNESS = 0.75; // Shape of the shadow mask; above 1 narrows it.
const float VEXP_LIGHTING_SHADOW_STRENGTH = 0.25; // Shadow tint strength, 0..1; 0 disables it.
const float VEXP_LIGHTING_LIGHT_STRENGTH = 0.25; // Lit-area tint strength, 0..1; 0 disables it.
const vec3 VEXP_LIGHTING_SHADOW_TINT = vec3(0.85, 0.75, 1.0); // RGB multiplier for shadowed surfaces.
const vec3 VEXP_LIGHTING_LIGHT_TINT = vec3(1.0, 0.95, 0.95); // RGB multiplier for lit surfaces.
const bool VEXP_LIGHTING_DEBUG_MODE = false; // Outputs shadow (red) and lit (green) masks instead of lighting.

layout(std140) uniform Lighting {
    vec3 Light0_Direction;
    vec3 Light1_Direction;
};

vec2 minecraft_compute_light(vec3 lightDir0, vec3 lightDir1, vec3 normal) {
    return vec2(dot(lightDir0, normal), dot(lightDir1, normal));
}

vec4 minecraft_mix_light_separate(vec2 light, vec4 color) {
    vec2 lightValue = max(vec2(0.0), light);
    float directionalInput = clamp(lightValue.x + lightValue.y, 0.0, 1.0);
    float directionalLight = pow(directionalInput, max(VEXP_DIRECTIONAL_LIGHT_HARDNESS, 0.01)) * VEXP_DIRECTIONAL_LIGHT_STRENGTH;
    vec3 lighting = VEXP_AMBIENT_LIGHT_COLOR * VEXP_AMBIENT_LIGHT_STRENGTH
        + VEXP_DIRECTIONAL_LIGHT_COLOR * directionalLight;
    float pivot = clamp(VEXP_LIGHTING_CONTRAST_PIVOT, 0.0, 1.0);
    lighting = clamp((lighting - pivot) * VEXP_LIGHTING_CONTRAST + pivot, 0.0, 1.0);

    float luminance = dot(lighting, vec3(0.2126, 0.7152, 0.0722));
    float halfWidth = clamp(VEXP_LIGHTING_SOFTNESS, 0.001, 1.0) * 0.5;
    float shadowMask = 1.0 - smoothstep(VEXP_LIGHTING_THRESHOLD - halfWidth, VEXP_LIGHTING_THRESHOLD + halfWidth, luminance);
    shadowMask = pow(clamp(shadowMask, 0.0, 1.0), clamp(VEXP_LIGHTING_MASK_HARDNESS, 0.01, 16.0));
    float lightMask = 1.0 - shadowMask;

    if (VEXP_LIGHTING_DEBUG_MODE) {
        return vec4(shadowMask, lightMask, 0.0, color.a);
    }

    vec3 shadowTint = mix(vec3(1.0), VEXP_LIGHTING_SHADOW_TINT, shadowMask * clamp(VEXP_LIGHTING_SHADOW_STRENGTH, 0.0, 1.0));
    vec3 lightTint = mix(vec3(1.0), VEXP_LIGHTING_LIGHT_TINT, lightMask * clamp(VEXP_LIGHTING_LIGHT_STRENGTH, 0.0, 1.0));
    lighting *= shadowTint * lightTint * max(VEXP_LIGHTING_BRIGHTNESS, 0.0);
    return vec4(color.rgb * lighting, color.a);
}

vec4 minecraft_mix_light(vec3 lightDir0, vec3 lightDir1, vec3 normal, vec4 color) {
    vec2 light = minecraft_compute_light(lightDir0, lightDir1, normal);
    return minecraft_mix_light_separate(light, color);
}

