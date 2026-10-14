#version 330

const bool VEXP_BLOOM_ENABLED = true; // Master switch; false leaves the scene untouched (the blur passes still run).

const int VEXP_BLOOM_SOURCE = 1; // Brightness measure: 0=luminance, 1=brightest RGB channel.
const float VEXP_BLOOM_THRESHOLD = 0.75; // Brightness where a pixel starts feeding the bloom.
const float VEXP_BLOOM_KNEE = 0.85; // Half-width of the threshold ramp; larger gives a softer cutoff.

const float VEXP_BLOOM_SIZE = 16.0; // Blur radius in screen pixels.
const float VEXP_BLOOM_SOFTNESS = 0.15; // Blur falloff, 0..1; low keeps a tight core, high spreads evenly.

const float VEXP_BLOOM_INTENSITY = 1.0; // Bloom strength multiplier.
const vec3 VEXP_BLOOM_COLOR = vec3(0.9, 0.85, 0.65); // Tint multiplied into the bloom; white leaves source colors.
const float VEXP_BLOOM_CONTRAST = 0.75; // Power curve on the bloom; above 1 shrinks it to the brightest cores.
const float VEXP_BLOOM_SATURATION = 1.0; // Bloom saturation; 0 is grayscale, above 1 is more vivid.
const int VEXP_BLOOM_MODE = 0; // How bloom joins the scene: 0=add, 1=screen (never overexposes).
const bool VEXP_BLOOM_DEBUG = false; // Shows only the bloom.

const int VEXP_BLOOM_TAPS = 24; // Blur samples per side; fixed at compile time.

float vexp_bloom_level(vec3 color) {
    return VEXP_BLOOM_SOURCE == 1 ? max(color.r, max(color.g, color.b)) : dot(color, vec3(0.2126, 0.7152, 0.0722));
}

vec3 vexp_bloom_extract(vec3 color) {
    float knee = max(VEXP_BLOOM_KNEE, 0.0001);
    float weight = smoothstep(VEXP_BLOOM_THRESHOLD - knee, VEXP_BLOOM_THRESHOLD + knee, vexp_bloom_level(color));
    return color * weight;
}

vec3 vexp_bloom_blur(sampler2D source, vec2 uv, vec2 direction, vec2 outSize) {
    float sigma = mix(0.25, 1.0, clamp(VEXP_BLOOM_SOFTNESS, 0.0, 1.0));
    vec2 stepUv = direction * max(VEXP_BLOOM_SIZE, 0.0) / outSize;
    vec3 sum = vec3(0.0);
    float total = 0.0;
    for (int i = -VEXP_BLOOM_TAPS; i <= VEXP_BLOOM_TAPS; ++i) {
        float t = float(i) / float(VEXP_BLOOM_TAPS);
        float weight = exp(-0.5 * t * t / (sigma * sigma));
        sum += texture(source, uv + stepUv * t).rgb * weight;
        total += weight;
    }
    return sum / total;
}

vec3 vexp_bloom_shape(vec3 bloom) {
    bloom = pow(max(bloom, vec3(0.0)), vec3(max(VEXP_BLOOM_CONTRAST, 0.01)));
    bloom = mix(vec3(dot(bloom, vec3(0.2126, 0.7152, 0.0722))), bloom, VEXP_BLOOM_SATURATION);
    return bloom * VEXP_BLOOM_COLOR * VEXP_BLOOM_INTENSITY;
}
