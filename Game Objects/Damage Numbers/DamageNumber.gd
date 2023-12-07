extends RigidBody2D
#Objects that displayer how much damage was dealt.

#***In theory can pool these***.

var damage_label:Label;

func on_created(damage:float, direction:Vector2):
	#print("On created")
	damage_label = get_node("DamageLabel");
	apply_impulse(direction * 110);
	damage_label.text = str(damage);

func _on_timer_timeout():
	queue_free();
