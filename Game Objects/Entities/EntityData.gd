#@tool
extends Resource
class_name EntityData
#Resource for all entities in the game.
#Entities can be defined as something that:
	#Has health
	#Has a hitbox, hurtbox or both.

#Godot doc link that talks about resources.
#https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html

#Could go further with this by creating an editor plugin.
#https://docs.godotengine.org/en/stable/classes/class_editorplugin.html#class-editorplugin

#NOTE: Need to make sure each variable has a default value.
#If not, could run into errors with changing the value within the inspector.
@export var health:float = 0.0;

func take_damage(_damage:float):
	#Virtual function for when a entity takes damage.
	pass;
	
func on_hitbox_entered():
	#Virtual function for when something enters the hitbox of the entity.
	pass;
	
func on_hurtbox_entered():
	#Virtual function for when something enters the hurtbox of the entity.
	#print("Hurtbox was hit.")
	pass;
