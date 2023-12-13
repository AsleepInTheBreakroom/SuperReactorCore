extends Node
#Responsible for spawning a bot when it dies.

@onready var respawn_bot_timer = $RespawnBotTimer;

var current_bot:Bot;

func _ready():
	spawn_bot();

func start_respawn_timer():
	respawn_bot_timer.start();

func _on_respawn_bot_timer_timeout():
	spawn_bot();

func spawn_bot():
	var bot_instance:PackedScene = load("res://Game Objects/Entities/Bots/Gunners/TwinFire/Bot_TwinFire.tscn");
	current_bot = bot_instance.instantiate();
	
	#Set bot variables.
	current_bot.global_position = Vector2(get_window().size.x/2, get_window().size.y/2);
	
	#Hook up signals.
	current_bot.has_died.connect(start_respawn_timer);

	#Add bot to the level.
	get_tree().root.get_node("TestLevel").add_child.call_deferred(current_bot); #Call defered to call at the end of the current frame.
