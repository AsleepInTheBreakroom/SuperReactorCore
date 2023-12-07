extends CharacterBody2D
class_name Bullet
#Base class for all types of bullets for the game.

#could make more accurate by doing raycsat method.
	#If the raycast of the bullet collides with an object.
	#Snap it to the collision point.

@export var data:BulletData;

@onready var life_timer = $LifeTimer;
@onready var sprite = $Sprite;

func on_created(pos:Vector2, dir:Vector2, bullet_speed:float):
	#Tells the bullet what to do when it is created.
	
	await ready #Wait for ready so we can get access to the onready variables.
	#***Should set collision info based on who shot the bullet.
	life_timer.start(data.life_time); #Start the life timer.
	global_position = pos;
	rotation = dir.angle_to_point(Vector2.ZERO);
	velocity = dir * (bullet_speed); #Set the velocity.
	#connect(Callable(data, "on_hitbox_entered"), queue_free);
	
func _physics_process(_delta):
	move_and_slide();

func _on_life_timer_timeout():
	queue_free();
