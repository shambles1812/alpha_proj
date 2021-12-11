/// @description Insert description here
// You can write your code in this editor

// draw GUI
draw_sprite(spr_ui_maximum,1,0,0);

// draw GUI bars
draw_sprite_ext(spr_ui_health,1,45,1055,1,max(0,hitPoints/maxHealth),0,c_white,1);
draw_sprite_ext(spr_ui_shield,1,105,1055,1,max(0,shieldPoints/maxShield),0,c_white,1);
draw_sprite_ext(spr_ui_reload,1,165,1055,1,max(0,gunCounter/gunValue),0,c_white,1);