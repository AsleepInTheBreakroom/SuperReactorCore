extends Entity
class_name Core
#Base class for all cores.

#Cores should do several things.
#Shoot projectiles at the player.
#Move about the scene.
#Take damage.

#Use the state method that was on the camera.
#Each state inherits from a base state.
#Then just swap out what state is on the core.

@onready var health_bar:ColorRect = $CoreUI/HealthBar;
@onready var health_bar_text:Label = $CoreUI/HealthBarText;

var health_bar_max_width:float;

func _ready():
	#Health Bar
	health_bar_max_width = health_bar.size.x;
	
	#Health Bar Text
	health_bar_text.size = health_bar.size;
	health_bar_text.position = health_bar.position;
	health_bar_text.text = str(health);

#func get_class_name() -> String:
	##Maybe stick things in grounds instead of having this function.
	#return("Core");

func take_damage(damage:float):
	super(damage);
	update_health_bar();
	
func update_health_bar():
	health_bar.size.x = health_bar_max_width * (health/data.max_health);
	health_bar_text.text = str(health);
