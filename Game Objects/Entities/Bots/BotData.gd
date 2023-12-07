extends EntityData
class_name BotData
#A resource that is used for the bots of the game.
#NOTE: Create new BotData resources for other bots based off of this.

@export var max_speed:float = 0.0;
@export var acceleration:float = 0.0;
#@export var deceleration:float = 0;
@export var friction_multiplier:float = 0.0;
@export var bullet_type:PackedScene;
@export var bullet_speed:float = 0.0;
@export var primary_rate_of_fire = 0.0;
@export var secondary_rate_of_fire = 0.0;
