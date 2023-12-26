extends Node2D

const CELL_SIZE:int = 16;

@export var sprite_sheet:Texture2D;
@export var num_of_sprites:int;

var sprite_array:Array;


func _ready():
	#Create additional sprites based off of sprite strip.
	
	#num_of_sprites = sprite_sheet.get_width()/16;
	
	#All sprites will be stored in this array.
	sprite_array.resize(num_of_sprites);
	print(sprite_array.size())
	
	var rows = sprite_sheet.get_width()/CELL_SIZE;
	var columns = sprite_sheet.get_height()/CELL_SIZE;
	var cell:int = 0;
	
	for j in columns:
		for i in rows:
			var sprite:Sprite2D = Sprite2D.new();
			sprite.texture = sprite_sheet;
			sprite.hframes = rows;
			sprite.vframes = columns
			sprite.frame = cell;
			sprite.position = Vector2(0, -cell*2)
			sprite.scale = Vector2(2,2)
			#sprite.frame_coords = Vector2(rows, columns); #Should make it use this, so can start at any point in the sprite sheet.
			sprite_array[cell] = sprite;
			add_child(sprite);
			
			cell += 1;
			if(cell > num_of_sprites-1):
				print(sprite_array)
				return;
			
		
	
		
		
		
	
	#Create the number of sprite needed.
	#Strip way.
	#for i in num_of_sprites:
		#var sprite:Sprite2D = Sprite2D.new();
		#sprite.texture = sprite_sheet;
		#sprite.hframes = num_of_sprites;
		#sprite.vframes = 1; #Will need to adjust for better sprite sheets.
		#sprite.frame = i;
		#sprite.position = Vector2(0,-i)
		#sprite.scale = Vector2(2,2)
		#sprite_array[i] = sprite;
		#add_child(sprite);

#func _draw():
	##draw_texture(sprite_sheet, Vector2.ZERO)
	##for i in num_of_sprites:
		##print(i)
	##draw_texture_rect(sprite_sheet, Rect2(Vector2.ZERO, Vector2(32,16)), true)
	#for i in num_of_sprites:
		#draw_texture_rect_region(sprite_sheet, 
								#Rect2(Vector2(0, -i) - Vector2(8,8), Vector2(16,16)), #Position and size of the tile.
								#Rect2(Vector2(i * 16, 0), Vector2(16,16)), #Tile to draw.
								#Color.WHITE,
								#false,
								#false);
	
func _process(delta):
	for sprite in sprite_array:
		sprite.rotate(deg_to_rad(5));
	pass
