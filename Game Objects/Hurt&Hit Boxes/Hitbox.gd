extends Area2D
class_name Hitbox

#NOTE: Hitboxes are placed on a layer and scan additional layers.

#Hitboxes only check for hurtboxes.

@export var damage:float = 0.0;

func _on_body_entered(body):
	#***NOT GOING TO WORRY ABOUT THIS YET****
	
	
	#Only bodies that the bullet should really collide with are the walls.
	#print("Colldied with body: " + str(body.name));
	
	#Just checking for collision with walls now.
		#Temporary.
	#***Probably check the type of the body.
	if(body.name == "StaticBody"):
		#print("Hit Wall")
		owner.queue_free();

func _on_area_entered(area):
	#If a hurtbox was hit, call functions on what did the hit and 
	if(area.is_in_group("Hurtboxes")):
		#print("Hitbox of " + owner.name + " hit " + area.owner.name + "'s hurtbox.")
		#print("Hurtbox of " + area.owner.name + " was hit by " + owner.name + "'s hitbox.")
		
		var hitbox_owner:Entity = owner;
		var hurtbox_owner:Entity = area.owner;
		
		#Tell the hitbox owner to do something upon the collision.
		hitbox_owner.on_hitbox_collision();
		
		#Tell the hurtbox's owner to do something upon the collision.
		hurtbox_owner.take_damage(damage);
		#hurtbox_owner.on_hurtbox_collision();
