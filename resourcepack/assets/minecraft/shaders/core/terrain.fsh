#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:chunksection.glsl>
#moj_import <minecraft:vexp_cave_fog.glsl>
#moj_import <minecraft:vexp_color_profile.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec4 vexpTerrainDebugColor;
in float vexpTerrainAOMask;
in float vexpTerrainColorShadowMask;
in vec4 vexpTerrainDebugLight;
in vec4 vexpTerrainDebugRawLightmap;
in float vexpTerrainDebugSkyLight;
in float vexpTerrainDebugBlockLight;
in vec2 texCoord0;

out vec4 fragColor;

vec4 sampleNearest(sampler2D source, vec2 uv, vec2 pixelSize, vec2 du, vec2 dv, vec2 texelScreenSize) {
    // Convert our UV back up to texel coordinates and find out how far over we are from the center of each pixel
    vec2 uvTexelCoords = uv / pixelSize;
    vec2 texelCenter = round(uvTexelCoords) - 0.5f;
    vec2 texelOffset = uvTexelCoords - texelCenter;

    // Move our offset closer to the texel center based on texel size on screen
    texelOffset = (texelOffset - 0.5f) * pixelSize / texelScreenSize + 0.5f;
    texelOffset = clamp(texelOffset, 0.0f, 1.0f);

    uv = (texelCenter + texelOffset) * pixelSize;
    return textureGrad(source, uv, du, dv);
}

vec4 sampleNearest(sampler2D source, vec2 uv, vec2 pixelSize) {
    vec2 du = dFdx(uv);
    vec2 dv = dFdy(uv);
    vec2 texelScreenSize = sqrt(du * du + dv * dv);
    return sampleNearest(source, uv, pixelSize, du, dv, texelScreenSize);
}

// Rotated Grid Super-Sampling
vec4 sampleRGSS(sampler2D source, vec2 uv, vec2 pixelSize) {
    vec2 du = dFdx(uv);
    vec2 dv = dFdy(uv);

    vec2 texelScreenSize = sqrt(du * du + dv * dv);
    float maxTexelSize = max(texelScreenSize.x, texelScreenSize.y);

    float minPixelSize = min(pixelSize.x, pixelSize.y);

    float transitionStart = minPixelSize * 1.0;
    float transitionEnd = minPixelSize * 2.0;
    float blendFactor = smoothstep(transitionStart, transitionEnd, maxTexelSize);

    float duLength = length(du);
    float dvLength = length(dv);
    float minDerivative = min(duLength, dvLength);
    float maxDerivative = max(duLength, dvLength);

    float effectiveDerivative = sqrt(minDerivative * maxDerivative);

    float mipLevelExact = max(0.0, log2(effectiveDerivative / minPixelSize));

    float mipLevelLow = floor(mipLevelExact);
    float mipLevelHigh = mipLevelLow + 1.0;
    float mipBlend = fract(mipLevelExact);

    const vec2 offsets[4] = vec2[](
    vec2(0.125, 0.375),
    vec2(-0.125, -0.375),
    vec2(0.375, -0.125),
    vec2(-0.375, 0.125)
    );

    vec4 rgssColorLow = vec4(0.0);
    vec4 rgssColorHigh = vec4(0.0);
    for (int i = 0; i < 4; ++i) {
        vec2 sampleUV = uv + offsets[i] * pixelSize;
        rgssColorLow += textureLod(source, sampleUV, mipLevelLow);
        rgssColorHigh += textureLod(source, sampleUV, mipLevelHigh);
    }
    rgssColorLow *= 0.25;
    rgssColorHigh *= 0.25;

    vec4 rgssColor = mix(rgssColorLow, rgssColorHigh, mipBlend);

    vec4 nearestColor = sampleNearest(source, uv, pixelSize, du, dv, texelScreenSize);

    return mix(nearestColor, rgssColor, blendFactor);
}

void main() {
    vec4 color = (UseRgss == 1 ? sampleRGSS(Sampler0, texCoord0, 1.0f / TextureSize) : sampleNearest(Sampler0, texCoord0, 1.0f / TextureSize)) * vertexColor;
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif

    if (VEXP_LIGHTMAP_DEBUG_MODE) {
        if (VEXP_TERRAIN_DEBUG_VIEW == 1) {
            fragColor = vec4(vexpTerrainDebugColor.rgb, color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 2) {
            float vertexLuma = dot(vexpTerrainDebugColor.rgb, vec3(0.2126, 0.7152, 0.0722));
            fragColor = vec4(vec3(vertexLuma), color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 3) {
            fragColor = vec4(vec3(vexpTerrainAOMask), color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 4) {
            fragColor = vec4(vexpTerrainColorShadowMask, 1.0 - vexpTerrainColorShadowMask, 0.0, color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 5) {
            fragColor = vec4(vec3(vexpTerrainDebugSkyLight), color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 6) {
            fragColor = vec4(vec3(vexpTerrainDebugBlockLight), color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 7) {
            fragColor = vec4(vexpTerrainDebugRawLightmap.rgb, color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 8) {
            fragColor = vec4(vec3(vexpTerrainDebugLight.r), color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 9) {
            fragColor = vec4(vec3(vexpTerrainDebugLight.g), color.a);
        } else if (VEXP_TERRAIN_DEBUG_VIEW == 10) {
            fragColor = vec4(vec3(vexpTerrainDebugLight.b), color.a);
        } else {
            fragColor = vec4(vexpTerrainDebugLight.rgb, color.a);
        }
        return;
    }

    color = mix(FogColor * vec4(1, 1, 1, color.a), color, ChunkVisibility);
    color.rgb = vexp_apply_color_profile(color.rgb, GameTime);
    color = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);

    float caveFog = vexp_cave_fog_amount(float(CameraBlockPos.y), sphericalVertexDistance, cylindricalVertexDistance);
    color.rgb = mix(color.rgb, FogColor.rgb, caveFog);
    fragColor = color;
}
