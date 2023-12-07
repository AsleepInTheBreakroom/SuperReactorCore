extends EntityData
class_name BulletData

#@export var damage:float = 0.0;
@export var life_time:float = 0.0;

signal destroy;

func on_hitbox_entered():
	#owner
	#print("Bullet Data")
	#Delete bullet.
	#print(name)
	#emit_signal("destroy");
	#connect()
	print(destroy.get_object())
