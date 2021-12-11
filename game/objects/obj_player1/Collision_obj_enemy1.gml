/// @description Insert description here
// You can write your code in this editor

// take damage
if (invulCounter <= 0) {
	
	// health damage
	if (shieldPoints == 0 && shieldExplode == false) {
		invulCounter = invulValue;
		hitPoints -= 1;
	}
	
	// shield damage
	if (shieldPoints != 0) {
		shieldPoints -= obj_enemy1.damage;
	}
	
	// shield invul
	if (shieldPoints == 0 && shieldExplode == true) {
		invulCounter = invulShieldValue;
		shieldExplode = false;
	}
	
	shieldCounter = shieldValue;
}