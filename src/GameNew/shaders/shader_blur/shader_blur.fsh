varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 size; //width,height,radius
uniform sampler2D mask; //texture

const int Quality = 8;
const int Directions = 16;
const float Pi = 6.28318530718; //pi * 2

void main()
{
    //create blur effect
    vec2 radius = size.z / size.xy;
    vec4 origCol = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 blurCol = origCol; 
    
    for(float d = 0.0; d < Pi; d += Pi / float(Directions))
    {
        for(float i= 1.0 / float(Quality); i <= 1.0; i += 1.0 / float(Quality))
        {
            blurCol += texture2D(gm_BaseTexture, v_vTexcoord + vec2(cos(d), sin(d)) * radius * i);
        }
    }
    
    blurCol /= float(Quality) * float(Directions) + 1.0;
    blurCol *= v_vColour;
    
    //get alpha from mask texture
    vec4 alphaBase = texture2D(mask, v_vTexcoord);
    float alphaVal = (alphaBase.r + alphaBase.g + alphaBase.b) / 3.0;
    
    //fade between blur color and non-blur color to create end result
    gl_FragColor = mix(blurCol, texture2D(gm_BaseTexture, v_vTexcoord), alphaVal);
}