/// @description Insert description here
// You can write your code in this editor
myGrav = pointer_null;
with(instance_create_layer(0,0,"GameComponents",staticGravity))
{
	myBody = other;
	baseOffset = -3;
	other.myGrav = self;
}

isCarried = false;
