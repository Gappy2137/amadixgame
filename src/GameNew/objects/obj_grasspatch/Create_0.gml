//cull = 2;

sprite = spr_grass_light_1;
frames = sprite_get_number(sprite);
texture = sprite_get_texture(sprite, 0);

grassCount = round((sprite_width * sprite_height) / 40);

color = c_white;
alpha = 1;

anim_frame = random(frames - 1);


width = sprite_get_width(sprite);
height = sprite_get_height(sprite);

format = 0;
_uvs = sprite_get_uvs(sprite, anim_frame);

// Vertex buffer
vbuff = 0;

// 3D properties
gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);

// Vertex format
vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();

format = vertex_format_end();

vbuff = vertex_create_buffer();

vertex_begin(vbuff, format);

_uvs = sprite_get_uvs(sprite, anim_frame);

repeat (grassCount) {

	var _x1 = irandom_range(bbox_left, bbox_right);
	var _y1 = irandom_range(bbox_top, bbox_bottom);
	var _x2 = (_x1 + round(_uvs[6] * width));
	var _y2 = (_y1 + round(_uvs[7] * height));

    var _depth = -_y2 + 2;
	
    // 2: Texture coordinates

    var _uv_x1 = _uvs[0];
    var _uv_y1 = _uvs[1];
    var _uv_x2 = _uvs[2];
    var _uv_y2 = _uvs[3];
	
    // 3: Triangle 1
    vertex_position_3d(vbuff, _x1, _y1, _depth);
    vertex_texcoord(vbuff, _uv_x1, _uv_y1);
    vertex_color(vbuff, color, alpha);

    vertex_position_3d(vbuff, _x2, _y1, _depth);
    vertex_texcoord(vbuff, _uv_x2, _uv_y1);
    vertex_color(vbuff, color, alpha);

    vertex_position_3d(vbuff, _x1, _y2, _depth);
    vertex_texcoord(vbuff, _uv_x1, _uv_y2);
    vertex_color(vbuff, color, alpha);
	
	
    // 4: Triangle 2
    vertex_position_3d(vbuff, _x2, _y1, _depth);
    vertex_texcoord(vbuff, _uv_x2, _uv_y1);
    vertex_color(vbuff, color, alpha);

    vertex_position_3d(vbuff, _x1, _y2, _depth);
    vertex_texcoord(vbuff, _uv_x1, _uv_y2);
    vertex_color(vbuff, color, alpha);

    vertex_position_3d(vbuff, _x2, _y2, _depth);
    vertex_texcoord(vbuff, _uv_x2, _uv_y2);
    vertex_color(vbuff, color, alpha);
	
}


vertex_end(vbuff);
vertex_freeze(vbuff);
