extends Node2D
class_name Core
#Base class for all cores.

#Cores should do several things.
#shoot projectiles at the player.
#Move about the scene.
#Take damage.

#Use the state method that was on the camera.
#Each state inherits from a base state.
#Then just swap out what state is on the core.

@export var data:CoreData;

@onready var health_bar:ColorRect = $CoreUI/HealthBar;
@onready var health_bar_text:Label = $CoreUI/HealthBarText;

const HEALTH_MAX:float = 10000; #One boss 10000 hp.

var health:float = HEALTH_MAX; 
var health_bar_max_width:float;

func _ready():
	#Health Bar
	health_bar_max_width = health_bar.size.x;
	
	#Health Bar Text
	health_bar_text.size = health_bar.size;
	health_bar_text.position = health_bar.position;
	health_bar_text.text = str(health);

func get_class_name() -> String:
	#Maybe stick things in grounds instead of having this function.
	return("Core");

func take_damage(damage:float):
	health -= damage;
	update_health_bar();
	
func update_health_bar():
	health_bar.size.x = health_bar_max_width * (health/HEALTH_MAX);
	health_bar_text.text = str(health);
