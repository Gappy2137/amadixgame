gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);

vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();

format = vertex_format_end();

vbuff = vertex_create_buffer();

vertex_begin(vbuff, format);

var _x1 = -sprite_xoffset;
var _y1 = -sprite_yoffset;
var _x2 = sprite_width - sprite_xoffset;
var _y2 = sprite_height - sprite_yoffset;

var _uvs = sprite_get_uvs(_spr, anim_frame);

var _uv_x1 = _uvs[0];
var _uv_y1 = _uvs[1];
var _uv_x2 = _uvs[2];
var _uv_y2 = _uvs[3];

vertex_position_3d(vbuff, _x1, _y1, depth);
vertex_texcoord(vbuff, _uv_x1, _uv_y1);
vertex_color(vbuff, c_white, 1);

vertex_position_3d(vbuff, _x2, _y1, depth);
vertex_texcoord(vbuff, _uv_x2, _uv_y1);
vertex_color(vbuff, c_white, 1);

vertex_position_3d(vbuff, _x1, _y2, depth);
vertex_texcoord(vbuff, _uv_x1, _uv_y2);
vertex_color(vbuff, c_white, 1);


vertex_position_3d(vbuff, _x2, _y1, depth);
vertex_texcoord(vbuff, _uv_x2, _uv_y1);
vertex_color(vbuff, c_white, 1);

vertex_position_3d(vbuff, _x1, _y2, depth);
vertex_texcoord(vbuff, _uv_x1, _uv_y2);
vertex_color(vbuff, c_white, 1);

vertex_position_3d(vbuff, _x2, _y2, depth);
vertex_texcoord(vbuff, _uv_x2, _uv_y2);
vertex_color(vbuff, c_white, 1);

vertex_end(vbuff);
vertex_freeze(vbuff);
