// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_origin(sprite, subimg, ox, oy, x, y, xs, ys, rot, col, alpha){
/// draw_sprite_origin_ext(sprite, subimg, ox, oy, x, y, xs, ys, rot, col, alpha)
//                              0       1   2   3  4  5   6   7    8    9     10
var oxx = ox - sprite_get_xoffset(sprite);
var oyy = oy - sprite_get_yoffset(sprite);
draw_sprite_ext(sprite, subimg,
    x - xs * lengthdir_x(oxx, rot) - ys * lengthdir_x(oyy, rot - 90),
    y - xs * lengthdir_y(oxx, rot) - ys * lengthdir_y(oyy, rot - 90),
    xs, ys, rot, col, alpha);
}