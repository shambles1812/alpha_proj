/// @description Insert description here
// You can write your code in this editor

// draw self
draw_self();

// draw text
draw_set_font(font_hitPoints);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_color(x,y,textToShow,lineHeight,textWidth,c_black,c_black,c_black,c_black,image_alpha);
