/// @description Insert description here
// You can write your code in this editor
if(myBody!= pointer_null)
{
	goRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
	goLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	goDive =  keyboard_check(vk_down) || keyboard_check(ord("S"));
	tryFlap = keyboard_check(vk_up) || keyboard_check(ord("W"));
	doAlt = (keyboard_check(vk_shift));
	doAttack = keyboard_check(vk_space);
	doPassive = (keyboard_check_pressed(vk_control));
	
	//combines horizontal inputs
	move = goRight - goLeft;

}






