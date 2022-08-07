//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float alphaGLSL;
uniform sampler2D other_texture; // <-- This holds the Applicaiton Surface

void main()
{
    vec4 base_tex_col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 other_tex_col = v_vColour * texture2D(other_texture, v_vTexcoord);
    vec4 final_tex_col = (base_tex_col + other_tex_col) / 2.0;

    gl_FragColor =  vec4(final_tex_col.rbg, final_tex_col.a * alphaGLSL);// This works!
}