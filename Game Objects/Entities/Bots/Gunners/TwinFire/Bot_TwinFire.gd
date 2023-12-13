extends Bot
#Twin Fire Bot

#Will need to divide bots into types based on how they move.
#For right now this would be a kinematic bot.
	#Would actually need to change the parent script for that.
	#Would just need a generic bot class that extends node.
	#Or something. 
	#Look into the one light weight class thing and use that as a variable type...
	#That could be called in a bot class to store bot info.
	#That way different bots could use it.
	
#Oh and maybe try to hide variables that shouldnt be changed in the children.

var shoot_point_index:int = 0;

func debug():
	super();
	
func _process(_delta):
	debug();
	
	#Shooting
	if(left_button_pressed):
		if(primary_fire_timer.is_stopped()):
			primary_fire();
			
func _physics_process(_delta):
	move();
	
func move():
	if(input != Vector2.ZERO):
		velocity += input * data.acceleration;
		velocity = velocity.limit_length(data.max_speed);
		pass;
	else:
		if(velocity != Vector2.ZERO):
			velocity *= data.friction_multiplier;
			if(velocity.is_zero_approx()):
				velocity = Vector2.ZERO;
	
	#Alt way of decellerating.
	#Could also do:
		#velocity = velocity.move_toward(Vector2.ZERO, decleration);
	#else:
		#if(velocity.length() > deceleration): 
			#velocity -= velocity.normalized() * deceleration; 
		#else:
			#velocity = Vector2.ZERO;
	
	move_and_slide(); #Delta get applied to this so no need to pass it in.

func primary_fire():
	#Start the timer.
	primary_fire_timer.start(data.primary_rate_of_fire);
	
	#Instance the bullet.
	var bullet_inst:Bullet = data.bullet_type.instantiate();
	
	#Get signal info.
	var dir_to_mouse:Vector2 = (get_global_mouse_position() - global_position).normalized();
	
	#Alternate where to shoot from.
	shoot_point_pivot.rotation = dir_to_mouse.angle_to_point(Vector2.ZERO)
	var shoot_point:Marker2D = shoot_point_pivot.get_child(shoot_point_index);
	shoot_point_index += 1;
	if(shoot_point_index > shoot_point_pivot.get_child_count() - 1): shoot_point_index = 0;

	#Give bonus speed to the bullet.
	#var bonus_speed:float = velocity.length()*.4 * dir_to_mouse.dot(velocity.normalized()); #Use the dot product as a speed multiplier.
	#bonus_speed *= 0.2;
	#if(sign(bonus_speed) == -1): bonus_speed = 0; #Dont decrease a bullets speed if the player is moving in the opposite direction of the mouse.
		#Might be worhtless to do.
		#But could be usefull for slower bullet types.
	
	#Do signal stuff.
	fire_primary.connect(Callable(bullet_inst, "on_created"));
	fire_primary.emit(shoot_point.global_position, dir_to_mouse, data.bullet_speed);
	fire_primary.disconnect(Callable(bullet_inst, "on_created"))
	
	#Add the bullet to the level.
		#Need a better way to add a child.
	get_tree().root.get_node("TestLevel").add_child(bullet_inst);
