/// @description Insert description here
// You can write your code in this editor

// health convert
textShield = string(shieldPoints);
textHP = string(hitPoints);
textToShow = "Shield: " + textShield + " Hitpoints: " + textHP;

// shield cant be higher than max amount
if (shieldPoints > maxShield) {
	shieldPoints = maxShield;
}

// shield cant be negative
if (shieldPoints < 0) {
	shieldPoints = 0;
}

// invul cant be negative
if (invulCounter < 0) {
	invulCounter = 0;
}

// invul cooldown
if (invulCounter != 0) {
	invulCounter -= invulSpeed;
}

// shield cooldown
if (shieldCounter != 0) {
	shieldCounter -= shieldSpeed;
}

if (shieldPoints != maxShield && shieldCounter <= 0) {
	shieldPoints += shieldRefresh;
}

// shield invul detect
if (shieldPoints != 0) {
	shieldExplode = true;
}

// player controls
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveDown = keyboard_check(vk_down);
moveUp = keyboard_check(vk_up);

// movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

// playerState check

if !collision_point(x,y,obj_playerState,true,true) {
	playerState = "normal";
}

if collision_point(x,y,obj_slow,true,true) {
	playerState = "slowed";
}

// playerState movement
switch (playerState) {
	
	case "normal":
		// vertical and horizontal moving
		if ((vx != 0 || vy != 0) && (abs(vx) + abs(vy) = walkSpeed)) {
	
			if !collision_point(x+vx,y,obj_border,true,true) {
				x += vx;
			}

			if !collision_point(x,y+vy,obj_border,true,true) {
				y += vy;
			}
		}
	
		// diagonal movement
		if ((vx != 0 || vy != 0) && (abs(vx) + abs(vy) != walkSpeed)) {
			vx = ((moveRight - moveLeft) * sqrt((walkSpeed * walkSpeed)/2));
			vy = ((moveDown - moveUp) * sqrt((walkSpeed * walkSpeed)/2));
	
			if !collision_point(x+vx,y,obj_border,true,true) {
				x += vx;
			}

			if !collision_point(x,y+vy,obj_border,true,true) {
				y += vy;
			}
		}
	break;
	
	case "slowed":
		// vertical and horizontal moving
		if ((vx != 0 || vy != 0) && (abs(vx) + abs(vy) = walkSpeed)) {
	
			if !collision_point(x+vx,y,obj_border,true,true) {
				x += vx/2;
			}

			if !collision_point(x,y+vy,obj_border,true,true) {
				y += vy/2;
			}
		}
	
		// diagonal movement
		if ((vx != 0 || vy != 0) && (abs(vx) + abs(vy) != walkSpeed)) {
			vx = ((moveRight - moveLeft) * sqrt((walkSpeed * walkSpeed)/2));
			vy = ((moveDown - moveUp) * sqrt((walkSpeed * walkSpeed)/2));
	
			if !collision_point(x+vx,y,obj_border,true,true) {
				x += vx/2;
			}

			if !collision_point(x,y+vy,obj_border,true,true) {
				y += vy/2;
			}
		}
	break;
}

// gun cooldown cant be more than max
if (gunCounter > gunValue) {
	gunCounter = gunValue;
}

// gun shot and cooldown
if (gunCounter != gunValue) {
	gunCounter += attackSpeed;
}

if (gunCounter == gunValue && mouse_check_button(mb_left)) {
	gunCounter = 0;
	with (instance_create_layer(x,y,"bullets",obj_bullet)) {
		direction = point_direction(obj_player1.x,obj_player1.y,mouse_x,mouse_y);
		speed = obj_player1.bulletSpeed;
	}
}

// depth sorting
depth = -y;

// debug
show_debug_message("shield: " + string(shieldExplode));
show_debug_message("invul: " + string(invulCounter));
