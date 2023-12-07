extends Area2D
class_name Hitbox

#NOTE: Hitboxes are placed on a layer and scan additional layers.

signal create_damage_number(damage:float, direction:Vector2);

@export var damage:float = 0.0;

func _on_body_entered(body):
	#Only bodies that the bullet should really collide with are the walls.
	#print("Colldied with body: " + str(body.name));
	
	#Just checking for collision with walls now.
		#Temporary.
	if(body.name == "StaticBody"):
		#print("Hit Wall")
		owner.queue_free();

func _on_area_entered(area):
	#Really only needed for hitting hurtboxes of the bots or cores.
	#print("Collided with area")
	if(area.is_in_group("Hurtboxes")):
		#Mainly just doing this for deleting bullets.
		#***HERE
		#Tring to make the bullet delete itself upon impact but not sure how to hook things up.
		#Could just connec tthe on_area_entered to the bullet script.
			#Maybe that is the way to handle stuff since interactions will all be different.
			#But hurtboxes will be the same.
			#So maybe move this code over to the hurt box script.
		owner.data.on_hitbox_entered();
		
		var thing = area.owner;
		
		#Call the function for when something enter's the owners hurtbox.
		thing.data.on_hurtbox_entered();
		
		#Spawn a damage number.
		create_damage_text(thing.global_position);

func create_damage_text(thing_positon:Vector2):
	#Get the direction to shoot the damage number in.
	var dir:Vector2 = Vector2.ZERO;
	if(global_position < thing_positon):
		dir = Vector2(-1, -1);
	else:
		dir = Vector2(1, -1);
	
	#Instance a damage number.
	var damage_number = load("res://Game Objects/Damage Numbers/DamageNumber.tscn");
	var damage_number_inst:RigidBody2D = damage_number.instantiate();
	damage_number_inst.top_level = true;
	damage_number_inst.global_position = global_position;
	connect("create_damage_number", Callable(damage_number_inst, "on_created"))
	emit_signal("create_damage_number", damage, dir);
	disconnect("create_damage_number", Callable(damage_number_inst, "on_created"))
	
	#Add the instance to the level.
	get_tree().root.get_node("TestLevel").add_child(damage_number_inst);
