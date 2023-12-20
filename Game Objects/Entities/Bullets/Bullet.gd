extends Entity
class_name Bullet
#Base class for all types of bullets for the game.

#Could make more accurate by doing raycsat method.
	#If the raycast of the bullet collides with an object.
	#Snap it to the collision point.
#Might be beneficial for high speed bullets.

#@export var data:BulletData;

@onready var life_timer = $LifeTimer;

func on_created(pos:Vector2, direction:Vector2, bullet_speed:float):
	#Tells the bullet what to do when it is created.
	
	await ready #Wait for ready so we can get access to the onready variables.
	#***Should set collision info based on who shot the bullet.
	life_timer.start(data.life_time); #Start the life timer.
	global_position = pos;
	rotation = direction.angle_to_point(Vector2.ZERO);
	velocity = direction * (bullet_speed); #Set the velocity.
	
func _physics_process(_delta):
	move_and_slide();

func _on_life_timer_timeout():
	queue_free();

func on_hitbox_collision():
	#If the bullet collides with something just delete it for now.
	queue_free();
