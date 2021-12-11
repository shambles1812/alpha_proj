/// @description Insert description here
// You can write your code in this editor

// take damage
if (hitPoints > 0) {
	hitPoints -= obj_bullet.damage;
}

// destroy
if (hitPoints <= 0) {
	instance_destroy();
}