gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);

var t_matrix = matrix_build((x + lengthdir_x(0, angle)),(y + lengthdir_y(0, angle)),0,0,0,angle,1,1,1);

matrix_set(matrix_world,t_matrix);
vertex_submit(vbuff, pr_trianglelist, _texture);
matrix_set(matrix_world,matrix_build_identity());

gpu_set_ztestenable(false);
gpu_set_alphatestenable(false);

//draw_sprite_ext(sprite_index, anim_frame, (x), (y), 1, 1, angle, c_white, 1);
/*
var col = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_floor_m4, false, true);
if (col){
	draw_sprite_part_ext(sprite_index, 0, 0, 0, 16, 18, x, y, 1, 1, c_white, 1);
}

