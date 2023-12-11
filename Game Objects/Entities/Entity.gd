extends CharacterBody2D
class_name Entity
#Entities are the most basic thing an object can be in the game.
#Entities:
	#Include variables that pertain to a vareity of different game objects.
	#Move around the game world.
	#Have hit/hurt boxes and manage there interactions

@export var data:EntityData;

var health = 0;

func _enter_tree():
	#Initialize the variables on the object from the data.
	#If children need to do this, put _enter_tree() in the childs code and then at the top call super.
	#Super will call the parent's _enter_tree() fucntion and then it will run what is in the child.
	health = data.max_health;

func take_damage(_damage:float):
	#Virtual function for when a entity takes damage.
	pass;

func on_hitbox_collision():
	#Virtual function for when the entity's hitbox collides with a hurtbox.
	pass;

func on_hurtbox_collision():
	#Virtual function for when the entity's hurtbox collides with a hitbox.
	#print("Hurtbox of " + hitinfo["hurtbox_owner"].name + " got hit by " + hitinfo["hitbox_owner"].name + "'s hitbox.")
	pass;

#func hitbox_collision_with_body():
	##Virtual function for when the entity's hitbox collides with an body.
	#pass;

#func hurtbox_collision_with_body():
	##Virtual function for when the entity's hurtbox collides with an body.
	#pass;
