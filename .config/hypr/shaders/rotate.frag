// vim: set ft=glsl:
// blue light filter shader

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec2 coord = v_texcoord;
    float angle = 0.5;
    float sin_factor = sin(angle);
    float cos_factor = cos(angle);
    coord = vec2((coord.x - 0.5), coord.y - 0.5) * mat2(cos_factor, sin_factor, -sin_factor, cos_factor);
    coord += 0.5;

    gl_FragColor = texture2D(tex, coord);
}