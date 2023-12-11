extends Area2D
class_name Hitbox

#NOTE: Hitboxes are placed on a layer and scan additional layers.

#Hitboxes only check for hurtboxes.

signal spawn_damage_number(damage:float, direction:Vector2);

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
		
		#Tell the owner of the hitbox to do something upon the collision.
		owner.on_hitbox_collision();
		
		#Tell the owner of the hurtbox to do something upon the collision.
		area.owner.take_damage(damage);
		area.owner.on_hurtbox_collision();
		
		#Create a damage number.
		create_damage_number(area.owner.global_position, area.shape_owner_get_shape(0,0));

func create_damage_number(pos:Vector2, shape:Shape2D):
	#SHOULD SPAWN THE NUMBER AT THE POSITION THAT WAS HIT
	#SHOULD BE ABLE TO USE THE HITBOXES AREA
	#OR EVEN THE POINT OF COLLISION IF THAT IS AVAILBALBE THROUGH THE AREA.
	
	#Get the direction to shoot the damage number in.
	var dir:Vector2 = Vector2.ZERO;
	if(global_position < pos): #Global position is the hitboxs.
		dir = Vector2(-1, -1);
	else:
		dir = Vector2(1, -1);
	
	#Instance a damage number.
	var damage_number = load("res://Game Objects/Damage Numbers/DamageNumber.tscn");
	var damage_number_inst:RigidBody2D = damage_number.instantiate();
	
	#Set some variables on the damage number.
	connect("spawn_damage_number", Callable(damage_number_inst, "spawn"))
	emit_signal("spawn_damage_number", damage, dir);
	disconnect("spawn_damage_number", Callable(damage_number_inst, "spawn"))
	
	#Position the damage number based on the shape of the hurtbox that was collided with.
	#match shape.get
	match shape.get_class():
		"CircleShape2D":
			damage_number_inst.global_position = Vector2(pos.x + (dir.x * shape.radius), pos.y)
		_:
			damage_number_inst.global_position = pos;
	
	
	
	#Add the instance to the level.
	get_tree().root.get_node("TestLevel").add_child(damage_number_inst);
	
	
