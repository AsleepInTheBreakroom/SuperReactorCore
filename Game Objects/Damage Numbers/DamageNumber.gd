extends RigidBody2D
#Objects that displayer how much damage was dealt.

#***In theory can pool these***.

#Might simplift this object down.
#Just think that this shouldnt be a rigidbody.
#Seems costly, especially if there willl be a lot on screen.

var damage_label:Label;

func spawn(damage:float, direction:Vector2):
	
	#print("On created")
	damage_label = get_node("DamageLabel");
	apply_impulse(direction * 110);
	damage_label.text = str(damage);

func _on_timer_timeout():
	queue_free();
