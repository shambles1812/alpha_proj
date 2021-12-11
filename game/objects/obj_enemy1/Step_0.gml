/// @description Insert description here
// You can write your code in this editor

// playerState check

if !collision_point(x,y,obj_playerState,true,true) {
	playerState = "normal";
}

if collision_point(x,y,obj_slow,true,true) {
	playerState = "slowed";
}

// walk towards player
direction = point_direction(x,y,obj_player1.x,obj_player1.y);


if (playerState == "normal") {
	speed = movementSpeed;
}

if (playerState == "slowed") {
	speed = movementSpeed/2;
}

// depth sorting
depth = -y