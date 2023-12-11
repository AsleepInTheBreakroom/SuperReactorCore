#@tool
extends Resource
class_name EntityData
#Resource for all entities in the game.

#NOTE: Have to be careful about what data goes on this object.
#Shouldnt affect the data on this object directly...
#If you do it will affect the other objects that share the same data.

#Godot doc link that talks about resources.
#https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html

#Could go further with this by creating an editor plugin.
#https://docs.godotengine.org/en/stable/classes/class_editorplugin.html#class-editorplugin

#NOTE: Need to make sure each variable has a default value.
#If not, could run into errors with changing the value within the inspector.
@export var max_health:float = 0.0;
