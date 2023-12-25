extends Node2D

@export var sprite_strip:Texture2D;

var pos:Vector2;
var num_of_sprites:int;

func _ready():
	#Create additional sprites based off of sprite strip.
	
	num_of_sprites = sprite_strip.get_width()/16;
	
	#Create the number of sprite needed.
	for i in num_of_sprites:
		var sprite:Sprite2D = Sprite2D.new();
		add_child(sprite);
	
	#Create sprites.
	#Assign sprites the correct frame.
	#Offset them.
	#Then rotate them.
	
	pass;

func _draw():
	#draw_texture(sprite_strip, Vector2.ZERO)
	#for i in num_of_sprites:
		#print(i)
	#draw_texture_rect(sprite_strip, Rect2(Vector2.ZERO, Vector2(32,16)), true)
	for i in num_of_sprites:
		draw_texture_rect_region(sprite_strip, 
								Rect2(Vector2(0, -i) - Vector2(8,8), Vector2(16,16)), #Position and size of the tile.
								Rect2(Vector2(i * 16, 0), Vector2(16,16)), #Tile to draw.
								Color.WHITE,
								false,
								false);
	
func _process(delta):
	queue_redraw();
	
	#rotate(deg_to_rad(5));
	
	pass;
