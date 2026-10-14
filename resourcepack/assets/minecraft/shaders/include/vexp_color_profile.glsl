#version 330

// VEXP pass parameters should document purpose, units/range, and neutral value beside each control.
const float VEXP_COLOR_PROFILE_STRENGTH = 0.2; // Day/night tint blend: 0 disables it, 1 applies it fully.
const vec3 VEXP_COLOR_PROFILE_DAY_TINT = vec3(0.8, 1.1, 1.2); // RGB multiplier for daytime color grading.
const vec3 VEXP_COLOR_PROFILE_NIGHT_TINT = vec3(1.6, 0.9, 1.1); // RGB multiplier for nighttime color grading.

const float VEXP_TERRAIN_SKY_LIGHT_DAY_STRENGTH = 1.0; // Sky-light multiplier at daytime; 1 preserves brightness.
const float VEXP_TERRAIN_SKY_LIGHT_NIGHT_STRENGTH = 1.0; // Sky-light multiplier at nighttime; 1 preserves brightness.
const float VEXP_TERRAIN_SKY_LIGHT_TINT_STRENGTH = 0.2; // Blend of sky tint into terrain light; 0 disables tint.
const vec3 VEXP_TERRAIN_SKY_LIGHT_DAY_TINT = vec3(0.9, 1.2, 1.1); // RGB multiplier for daytime sky light.
const vec3 VEXP_TERRAIN_SKY_LIGHT_NIGHT_TINT = vec3(1.0, 0.6, 0.8); // RGB multiplier for nighttime sky light.

const float VEXP_LIGHTMAP_CONTRAST = 1.0; // Sky-light contrast around neutral luminance 0.5; 1 is neutral.
const float VEXP_LIGHTMAP_THRESHOLD = 0.8; // Sky-light level separating shadow mask from lit mask, 0..1.
const float VEXP_LIGHTMAP_SOFTNESS = 0.45; // Width of the sky-light transition; smaller is a harder edge.
const float VEXP_LIGHTMAP_SHADOW_STRENGTH = 0.35; // Strength of the shadow tint, 0..1.
const float VEXP_LIGHTMAP_LIGHT_STRENGTH = 0.35; // Strength of the lit-area tint, 0..1.
const float VEXP_LIGHTMAP_HARDNESS = 0.05; // Shape of the sky mask; above 1 narrows the shadow mask.

const float VEXP_TERRAIN_BLOCK_LIGHT_THRESHOLD = 0.3; // Block-light level where artificial light becomes visible.
const float VEXP_TERRAIN_BLOCK_LIGHT_SOFTNESS = 0.85; // Width of the artificial-light transition.
const float VEXP_TERRAIN_BLOCK_LIGHT_STRENGTH = 0.0; // Artificial-light tint strength, 0..1.

const bool VEXP_LIGHTMAP_DEBUG_MODE = false; // Shows masks instead of final lighting when enabled.
const int VEXP_TERRAIN_DEBUG_VIEW = 3; // 0=combined, 1=Color, 2=Color luma, 3=AO, 4=Color mask, 5=sky, 6=block, 7=lightmap, 8=shadow mask, 9=sky mask, 10=block mask.

const float VEXP_TERRAIN_COLOR_THRESHOLD = 0.55; // Vertex-Color luminance separating shaded and lit regions.
const float VEXP_TERRAIN_COLOR_SOFTNESS = 0.45; // Width of the vertex-Color shading transition.
const float VEXP_TERRAIN_COLOR_HARDNESS = 0.75; // Shape of the vertex-Color mask; 1 preserves its smooth ramp.
const float VEXP_TERRAIN_COLOR_CONTRAST = 1.5; // Contrast for vertex Color around luminance 0.5; 1 is neutral.
const float VEXP_TERRAIN_COLOR_SHADOW_STRENGTH = 0.25; // Vertex-Color shadow tint strength; 0 preserves current shading.
const float VEXP_TERRAIN_COLOR_LIGHT_STRENGTH = 0.25; // Vertex-Color light tint strength; 0 preserves current shading.
const vec3 VEXP_TERRAIN_COLOR_SHADOW_TINT = vec3(0.85, 0.75, 1.0); // Tint multiplier for shaded vertex Color.
const vec3 VEXP_TERRAIN_COLOR_LIGHT_TINT = vec3(1.0, 0.95, 0.95); // Tint multiplier for lit vertex Color.

const float VEXP_TERRAIN_AO_THRESHOLD = 0.7; // Vertex-Color luminance below which the AO proxy activates.
const float VEXP_TERRAIN_AO_SOFTNESS = 0.05; // Width of the AO-proxy transition.
const float VEXP_TERRAIN_AO_HARDNESS = 0.85; // AO-mask curve; above 1 concentrates it in darker vertices.
const float VEXP_TERRAIN_AO_CONTRAST = 0.9; // Contrast of the AO proxy around luminance 0.5; 1 is neutral.
const float VEXP_TERRAIN_AO_STRENGTH = 1.0; // AO-proxy tint strength; 0 disables the approximation.
const vec3 VEXP_TERRAIN_AO_TINT = vec3(0.6, 0.9, 0.95); // AO-proxy color multiplier.

const vec3 VEXP_SHADOW_TINT = vec3(0.83, 0.74, 0.96); // Shared shadow tint for lightmap and entity shadows.
const vec3 VEXP_LIGHT_TINT = vec3(1.08, 1.04, 0.96); // Tint multiplier for sky-lit areas.
const vec3 VEXP_TERRAIN_BLOCK_LIGHT_TINT = vec3(1.08, 0.96, 0.68); // Tint multiplier for torch/block light.

const float VEXP_ENTITY_SHADOW_BASE_BRIGHTNESS = 0.05; // Base RGB brightness of projected entity shadows.
const float VEXP_ENTITY_SHADOW_OPACITY = 0.45; // Projected entity-shadow opacity; preserves its soft alpha edge.

float vexp_daylight_factor(float gameTime) {
    return max(sin(fract(gameTime) * 6.2831853), 0.0);
}

float vexp_terrain_ao_mask(vec3 vertexColor) {
    float luminance = dot(vertexColor, vec3(0.2126, 0.7152, 0.0722));
    float softness = clamp(VEXP_TERRAIN_AO_SOFTNESS, 0.001, 1.0);
    float mask = 1.0 - smoothstep(VEXP_TERRAIN_AO_THRESHOLD, VEXP_TERRAIN_AO_THRESHOLD + softness, luminance);
    return pow(clamp(mask, 0.0, 1.0), clamp(VEXP_TERRAIN_AO_HARDNESS, 0.01, 16.0));
}

float vexp_terrain_color_shadow_mask(vec3 vertexColor) {
    float luminance = dot(vertexColor, vec3(0.2126, 0.7152, 0.0722));
    float softness = clamp(VEXP_TERRAIN_COLOR_SOFTNESS, 0.001, 1.0);
    float mask = 1.0 - smoothstep(VEXP_TERRAIN_COLOR_THRESHOLD - softness * 0.5, VEXP_TERRAIN_COLOR_THRESHOLD + softness * 0.5, luminance);
    return pow(clamp(mask, 0.0, 1.0), clamp(VEXP_TERRAIN_COLOR_HARDNESS, 0.01, 16.0));
}

vec3 vexp_apply_terrain_color_shading(vec3 vertexColor, float shadowMask) {
    float sourceLuminance = dot(vertexColor, vec3(0.2126, 0.7152, 0.0722));
    float safeLuminance = max(sourceLuminance, 0.001);
    float contrastedLuminance = clamp(0.5 + (sourceLuminance - 0.5) * VEXP_TERRAIN_COLOR_CONTRAST, 0.0, 1.0);
    vec3 contrastedColor = vertexColor * (contrastedLuminance / safeLuminance);
    float lightMask = 1.0 - shadowMask;
    vec3 shadowTint = mix(vec3(1.0), VEXP_TERRAIN_COLOR_SHADOW_TINT, shadowMask * clamp(VEXP_TERRAIN_COLOR_SHADOW_STRENGTH, 0.0, 1.0));
    vec3 lightTint = mix(vec3(1.0), VEXP_TERRAIN_COLOR_LIGHT_TINT, lightMask * clamp(VEXP_TERRAIN_COLOR_LIGHT_STRENGTH, 0.0, 1.0));
    return contrastedColor * shadowTint * lightTint;
}

vec3 vexp_apply_terrain_ao(vec3 vertexColor, float aoMask) {
    float sourceLuminance = dot(vertexColor, vec3(0.2126, 0.7152, 0.0722));
    float safeLuminance = max(sourceLuminance, 0.001);
    float contrastedLuminance = clamp(0.5 + (sourceLuminance - 0.5) * VEXP_TERRAIN_AO_CONTRAST, 0.0, 1.0);
    vec3 contrastedColor = vertexColor * (contrastedLuminance / safeLuminance);
    vec3 aoTint = mix(vec3(1.0), VEXP_TERRAIN_AO_TINT, clamp(aoMask * VEXP_TERRAIN_AO_STRENGTH, 0.0, 1.0));
    return contrastedColor * aoTint;
}

vec3 vexp_apply_color_profile(vec3 color, float gameTime) {
    vec3 tint = mix(VEXP_COLOR_PROFILE_NIGHT_TINT, VEXP_COLOR_PROFILE_DAY_TINT, vexp_daylight_factor(gameTime));
    return mix(color, color * tint, VEXP_COLOR_PROFILE_STRENGTH);
}

vec4 vexp_apply_terrain_sky_light(vec4 lightmap, float skyLightLevel, float blockLightLevel, float gameTime) {
    float daylight = vexp_daylight_factor(gameTime);
    float skyAmount = clamp(skyLightLevel, 0.0, 1.0);
    float blockAmount = clamp(blockLightLevel, 0.0, 1.0);
    float skyContribution = skyAmount / max(skyAmount + blockAmount, 0.001);
    skyAmount *= skyContribution;
    float skyStrength = mix(VEXP_TERRAIN_SKY_LIGHT_NIGHT_STRENGTH, VEXP_TERRAIN_SKY_LIGHT_DAY_STRENGTH, daylight);
    vec3 skyTint = mix(VEXP_TERRAIN_SKY_LIGHT_NIGHT_TINT, VEXP_TERRAIN_SKY_LIGHT_DAY_TINT, daylight);
    vec3 tintMultiplier = mix(vec3(1.0), skyTint, skyAmount * VEXP_TERRAIN_SKY_LIGHT_TINT_STRENGTH);
    float intensityMultiplier = mix(1.0, skyStrength, skyAmount);
    return vec4(lightmap.rgb * tintMultiplier * intensityMultiplier, lightmap.a);
}

vec4 vexp_apply_terrain_shadow_profile(vec4 lightmap, float skyLightLevel, float blockLightLevel) {
    float skyAmount = clamp(skyLightLevel, 0.0, 1.0);
    float blockAmount = clamp(blockLightLevel, 0.0, 1.0);
    float skyContribution = skyAmount / max(skyAmount + blockAmount, 0.001);
    float threshold = clamp(VEXP_LIGHTMAP_THRESHOLD, 0.0, 1.0);
    float softness = clamp(VEXP_LIGHTMAP_SOFTNESS, 0.001, 1.0);
    float rampStart = threshold - softness * 0.5;
    float rampEnd = threshold + softness * 0.5;
    float shadowMask = 1.0 - smoothstep(rampStart, rampEnd, skyAmount);
    shadowMask = pow(clamp(shadowMask, 0.0, 1.0), clamp(VEXP_LIGHTMAP_HARDNESS, 0.01, 16.0));
    float skyLightMask = 1.0 - shadowMask;
    float blockThreshold = clamp(VEXP_TERRAIN_BLOCK_LIGHT_THRESHOLD, 0.0, 1.0);
    float blockSoftness = clamp(VEXP_TERRAIN_BLOCK_LIGHT_SOFTNESS, 0.001, 1.0);
    float blockLightMask = smoothstep(blockThreshold - blockSoftness * 0.5, blockThreshold + blockSoftness * 0.5, blockAmount);

    if (VEXP_LIGHTMAP_DEBUG_MODE) {
        return vec4(shadowMask, skyLightMask, blockLightMask, lightmap.a);
    }

    float contrastedSky = clamp(0.5 + (skyAmount - 0.5) * VEXP_LIGHTMAP_CONTRAST, 0.0, 1.0);
    float contrastScale = mix(1.0, contrastedSky / max(skyAmount, 0.001), skyContribution);
    vec3 contrastedLight = lightmap.rgb * contrastScale;
    float shadowAmount = shadowMask * clamp(VEXP_LIGHTMAP_SHADOW_STRENGTH, 0.0, 1.0) * skyContribution;
    float lightAmount = skyLightMask * clamp(VEXP_LIGHTMAP_LIGHT_STRENGTH, 0.0, 1.0) * skyContribution;
    vec3 shadowTintedLight = mix(vec3(1.0), VEXP_SHADOW_TINT, shadowAmount);
    vec3 lightTintedLight = mix(vec3(1.0), VEXP_LIGHT_TINT, lightAmount);
    vec3 blockTintedLight = mix(vec3(1.0), VEXP_TERRAIN_BLOCK_LIGHT_TINT, blockLightMask * clamp(VEXP_TERRAIN_BLOCK_LIGHT_STRENGTH, 0.0, 1.0));
    return vec4(contrastedLight * shadowTintedLight * lightTintedLight * blockTintedLight, lightmap.a);
}

vec4 vexp_apply_shadow_profile(vec4 lightmap) {
    float sourceLuminance = dot(lightmap.rgb, vec3(0.2126, 0.7152, 0.0722));
    float threshold = clamp(VEXP_LIGHTMAP_THRESHOLD, 0.0, 1.0);
    float softness = clamp(VEXP_LIGHTMAP_SOFTNESS, 0.001, 1.0);
    float rampStart = threshold - softness * 0.5;
    float rampEnd = threshold + softness * 0.5;
    float shadowMask = 1.0 - smoothstep(rampStart, rampEnd, sourceLuminance);
    float lightMask = 1.0 - shadowMask;

    if (VEXP_LIGHTMAP_DEBUG_MODE) {
        return vec4(shadowMask, lightMask, 0.0, lightmap.a);
    }

    float safeLuminance = max(sourceLuminance, 0.001);
    float contrastedLuminance = clamp(0.5 + (sourceLuminance - 0.5) * VEXP_LIGHTMAP_CONTRAST, 0.0, 1.0);
    float contrastScale = contrastedLuminance / safeLuminance;
    vec3 contrastedLight = lightmap.rgb * contrastScale;
    float shadowAmount = shadowMask * clamp(VEXP_LIGHTMAP_SHADOW_STRENGTH, 0.0, 1.0);
    float lightAmount = lightMask * clamp(VEXP_LIGHTMAP_LIGHT_STRENGTH, 0.0, 1.0);
    vec3 shadowTintedLight = mix(vec3(1.0), VEXP_SHADOW_TINT, shadowAmount);
    vec3 lightTintedLight = mix(vec3(1.0), VEXP_LIGHT_TINT, lightAmount);
    return vec4(contrastedLight * shadowTintedLight * lightTintedLight, lightmap.a);
}

vec4 vexp_apply_entity_shadow_profile(vec4 shadow) {
    shadow.rgb = vec3(VEXP_ENTITY_SHADOW_BASE_BRIGHTNESS) * VEXP_SHADOW_TINT;
    shadow.a *= VEXP_ENTITY_SHADOW_OPACITY;
    return shadow;
}
