/// @description Insert description here
// You can write your code in this editor

// draw self
draw_self();

// draw GUI
draw_sprite(spr_ui_enemy_maximum,1,x-128,y);

// draw GUI bars
draw_sprite_ext(spr_ui_enemy_health,1,x-128,y,max(0,hitPoints/maxHealth),1,0,c_white,1);