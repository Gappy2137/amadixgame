//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D u_Overlay;
uniform vec4      u_OverlayUV;
uniform vec4      u_SpriteUV;

void main() {
  gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
  vec2 pos = (v_vTexcoord - u_SpriteUV.xy) / (u_SpriteUV.zw - u_SpriteUV.xy);
  vec2 OverlayCoord = mix(u_OverlayUV.xy, u_OverlayUV.zw, pos);
  vec4 OverlayColor = texture2D( u_Overlay, OverlayCoord );
  gl_FragColor.rgb *= (1.0 - OverlayColor.a);
  gl_FragColor.rgb += OverlayColor.rgb * OverlayColor.a;
}