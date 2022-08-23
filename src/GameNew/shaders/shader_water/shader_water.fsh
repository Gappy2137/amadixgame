//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform vec2 Texel;

const float xSpeed = 0.01;
const float xFreq = 20.0;
const float xSize = 3.0;

const float yFreq = 100.0;
const float ySize = 7.0;

void main()
{
	float xWave = sin(Time * xSpeed + v_vTexcoord.y * xFreq) * (xSize * Texel.x) * v_vTexcoord.y;
	float yWave = sin(Time * xSpeed + v_vTexcoord.y * yFreq) * (ySize * Texel.y) * v_vTexcoord.y;
    gl_FragColor =  v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + vec2(xWave, yWave));
}