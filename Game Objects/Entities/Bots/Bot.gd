extends Entity
class_name Bot
#Base class that all Bots that use Kinematics will be derived from.

#Each robot is basically going to be a gun with legs.
#Each sould have a primary fire and secondary fire.
#Move speed, health, fire rate values, etc.

signal has_died;
signal fire_primary(bullet_position:Vector2, bullet_direction:Vector2, bonus_speed:float);

#NOTE: The name of data should NOT be change. 
#This variable is the same across other objects that use the EntityData resource.
#This is important for hit/hurtboxes since they check for the data variable.
#@export var data:BotData;

@onready var player_info_label:Label = $CanvasLayer/PlayerInfoLabel;
@onready var bot_info_label:Label = $BotInfoLabel;
@onready var primary_fire_timer:Timer = $PrimaryFireTimer;
@onready var shoot_point_pivot:Marker2D = $ShootPointPivot;

var input:Vector2 = Vector2.ZERO;
var left_button_pressed:bool = false;
var right_button_pressed:bool = false;

func _unhandled_key_input(_event):
	input = Input.get_vector("Keyboard_Left", "Keyboard_Right", "Keyboard_Up", "Keyboard_Down");

func _input(event):
	if(event.is_action_pressed("Primary_Fire")):
		left_button_pressed = true;
	if(event.is_action_released("Primary_Fire")):
		left_button_pressed = false;
		
	if(event.is_action_pressed("Secondary_Fire")):
		right_button_pressed = true;
	if(event.is_action_released("Secondary_Fire")):
		right_button_pressed = false;

func _ready():
	#Set Variables
	primary_fire_timer.wait_time = data.primary_rate_of_fire;
	pass;

func _process(_delta):
	#Virtual function that will get overriden in child bot classes.
	pass;
	
func _physics_process(_delta):
	#Virtual function that will get overriden in child bot classes.
	pass;

#func get_class_name() -> String:
	##Maybe stick things in grounds instead of having this function.
	#return("BotKinematic");

func take_damage(damage:float):
	super(damage);

func die():
	super();
	emit_signal("has_died");

func debug():
	#Display different things based on the bot.
	#Virtual function that will get overriden in child bot classes.
	
	#---Generic stuff all bots will display---
	#Player Info
	player_info_label.text = "Input: " + str(input);
	player_info_label.text += "\nVelocity: " + str(velocity);
	player_info_label.text += "\nVelocity Real: " + str(get_real_velocity());
	
	#Bot Info
	bot_info_label.position = Vector2(-bot_info_label.size.x/2, -bot_info_label.size.y + -20);
	bot_info_label.text = "Health: " + str(health);
	
	pass;

func move():
	#Determines how the bot will move.
	#Virtual function that will get overriden in child bot classes.
	pass;

func primary_fire():
	#The primary attacking method of the bot.
	#Virtual function that will get overriden in child bot classes.
	pass;
	
func secondary_fire():
	#The secondary attacking method of the bot.
	#Virtual function that will get overriden in child bot classes.
	pass;
	
#func take_damage(_damage:float):
	##Determines how the bot will take damge.
	##Virtual function that will get overriden in child bot classes.
	#pass;
