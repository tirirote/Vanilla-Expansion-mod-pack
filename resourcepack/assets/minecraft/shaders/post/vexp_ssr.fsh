#version 330

#moj_import <minecraft:vexp_screen_space.glsl>

const bool VEXP_SSR_ENABLED = false; // Master switch; false keeps the scene with only the occlusion applied.
const float VEXP_SSR_STRENGTH = 0.5; // Reflection strength multiplier, 0..1.
const float VEXP_SSR_REFLECTANCE = 0.1; // Head-on reflectance, 0..1; raising it makes every surface shinier.
const float VEXP_SSR_FRESNEL_POWER = 5.0; // Grazing-angle falloff; above 1 keeps reflections mostly at grazing angles.
const float VEXP_SSR_MAX_DISTANCE = 32.0; // Blocks a reflection ray travels before giving up.
const float VEXP_SSR_STEP_LENGTH = 0.5; // Blocks per march step; smaller finds thin geometry but costs more.
const float VEXP_SSR_THICKNESS = 0.75; // Blocks of depth tolerance for a hit; too low misses, too high streaks.
const float VEXP_SSR_BIAS = 0.05; // Blocks the ray starts off the surface to avoid self-hits.
const float VEXP_SSR_EDGE_FADE = 0.1; // Screen-edge fade width, 0..0.5; hides reflections of off-screen content.
const int VEXP_SSR_STEPS = 64; // March steps per pixel; fixed at compile time.
const int VEXP_SSR_REFINE_STEPS = 6; // Bisection steps after a hit; fixed at compile time.
const bool VEXP_SSR_DEBUG = false; // Shows only the reflection contribution.

uniform sampler2D SceneSampler;
uniform sampler2D MainDepthSampler;
uniform sampler2D AoSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 SceneSize;
    vec2 MainDepthSize;
    vec2 AoSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec3 scene = texture(SceneSampler, texCoord).rgb;
    float cover = texture(SceneSampler, texCoord).a;
    float ao = mix(texture(AoSampler, texCoord).r, 1.0, cover);
    float depth = texture(MainDepthSampler, texCoord).r;

    if (!VEXP_SSR_ENABLED || vexp_ss_is_sky(depth) || cover > 0.5) {
        fragColor = vec4(scene * ao, 1.0);
        return;
    }

    float aspect = OutSize.x / OutSize.y;
    vec2 texel = 1.0 / OutSize;
    vec3 pos = vexp_ss_position_at(MainDepthSampler, texCoord, aspect);
    vec3 normal = vexp_ss_view_normal(MainDepthSampler, texCoord, texel, aspect);
    vec3 viewDir = normalize(pos);
    vec3 rayDir = reflect(viewDir, normal);

    vec3 rayPos = pos + normal * VEXP_SSR_BIAS;
    bool hit = false;
    vec2 hitUv = vec2(0.0);
    float travelled = 0.0;
    for (int i = 0; i < VEXP_SSR_STEPS; ++i) {
        vec3 prevPos = rayPos;
        rayPos += rayDir * VEXP_SSR_STEP_LENGTH;
        travelled += VEXP_SSR_STEP_LENGTH;
        if (travelled > VEXP_SSR_MAX_DISTANCE || rayPos.z <= VEXP_SS_NEAR_PLANE) {
            break;
        }

        vec2 uv = vexp_ss_project(rayPos, aspect);
        if (any(lessThan(uv, vec2(0.0))) || any(greaterThan(uv, vec2(1.0)))) {
            break;
        }

        float sceneZ = vexp_ss_linear_depth(textureLod(MainDepthSampler, uv, 0.0).r);
        if (rayPos.z > sceneZ) {
            if (rayPos.z - sceneZ < VEXP_SSR_THICKNESS) {
                vec3 lo = prevPos;
                vec3 hi = rayPos;
                for (int j = 0; j < VEXP_SSR_REFINE_STEPS; ++j) {
                    vec3 mid = 0.5 * (lo + hi);
                    float midZ = vexp_ss_linear_depth(textureLod(MainDepthSampler, vexp_ss_project(mid, aspect), 0.0).r);
                    if (mid.z > midZ) {
                        hi = mid;
                    } else {
                        lo = mid;
                    }
                }
                hit = true;
                hitUv = vexp_ss_project(hi, aspect);
            }
            break;
        }
    }

    if (!hit) {
        fragColor = vec4(scene * ao, 1.0);
        return;
    }

    vec2 edgeDist = min(hitUv, 1.0 - hitUv);
    float edgeFade = smoothstep(0.0, max(VEXP_SSR_EDGE_FADE, 1e-4), min(edgeDist.x, edgeDist.y));
    vec3 reflected = textureLod(SceneSampler, hitUv, 0.0).rgb * textureLod(AoSampler, hitUv, 0.0).r;

    float cosTheta = clamp(dot(normal, -viewDir), 0.0, 1.0);
    float reflectance = clamp(VEXP_SSR_REFLECTANCE, 0.0, 1.0);
    float fresnel = reflectance + (1.0 - reflectance) * pow(1.0 - cosTheta, max(VEXP_SSR_FRESNEL_POWER, 0.01));
    float weight = clamp(VEXP_SSR_STRENGTH, 0.0, 1.0) * fresnel * edgeFade;

    if (VEXP_SSR_DEBUG) {
        fragColor = vec4(reflected * weight, 1.0);
        return;
    }

    fragColor = vec4(mix(scene * ao, reflected, weight), 1.0);
}
