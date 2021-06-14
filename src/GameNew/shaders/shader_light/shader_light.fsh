varying vec2 v_vTexcoord;
varying vec4 v_vColor;

uniform sampler2D normalmap;
uniform vec3 lightpos; //normalized
uniform vec2 resolution; //render target resolution

void main()
{
	const vec3 falloff = vec3(0.4, 3.0, 20.0);
	
	vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 normalraw = texture2D(normalmap,gl_FragCoord.xy / resolution);
	vec3 normal = normalraw.rgb;
	
	//Delta position of the light
	vec3 lightdir = vec3(lightpos.xy - (gl_FragCoord.xy / resolution), lightpos.z - (1.0 - normalraw.a));
	lightdir.x *= resolution.x/resolution.y;
	
	//distance
	float D = length(lightdir);
	
	//normalize
	vec3 N = normalize(normal * 2.0 - 1.0);
	vec3 L = normalize(lightdir);
	
	//premultiply light alpha, N dot L for diffuse term
	vec3 diffuse = (v_vColor.rgb * v_vColor.a) * max(dot(N,L), 0.0);
	
	//attenuation
	float att = 1.0 / (falloff.x + (falloff.y*D) + (falloff.z*D*D));
	
	vec3 intensity = diffuse * att;
	vec3 out_col = base_col.rgb * intensity;
	
	gl_FragColor = vec4(out_col, base_col.a);
}
