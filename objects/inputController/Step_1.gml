/// @description Insert description here
// You can write your code in this editor
if(myBody!= pointer_null)
{
	goRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
	goLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	goDive =  keyboard_check(vk_down) || keyboard_check(ord("S"));
	doDesc = (myBody.onGround > 0 && keyboard_check(vk_shift));
	doPeck = (myBody.onGround == 0 && myBody.carrying == pointer_null && keyboard_check(vk_space));
	tryFlap = keyboard_check(vk_up) || keyboard_check(ord("W"));
	doPoo = (myBody.sincePoo >= myBody.pooLatency && myBody.onGround > 0 && keyboard_check(vk_space));
	doWak = (keyboard_check_pressed(vk_control));
	setNest = (keyboard_check(ord("N")) && !RoomControl.isNestSet && myBody.onGround == 0);

	//combines horizontal inputs
	move = goRight - goLeft;

}






