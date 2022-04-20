varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texture_size;
uniform vec2 window_size;

void main()
{
	vec2 texel = (window_size * 1.) / texture_size;
	
	vec4 color = (
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y)) +
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y)) +
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - texel.y)) +
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + texel.y))) / 4.;
	
	vec4 color2 = (
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y - texel.y)) +
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y - texel.y)) +
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - texel.x, v_vTexcoord.y + texel.y)) +
	texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + texel.x, v_vTexcoord.y + texel.y))) / 4.;
	
	
	vec4 original_color = texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec4 final_color = (color + color2 + original_color) / 3.;
	
	gl_FragColor = v_vColour * final_color;
}