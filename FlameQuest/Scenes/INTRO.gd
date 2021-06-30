extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var speed
var screensize

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport().size
	pass # Replace with function body.

func _process(delta):
	var velocity = Vector2()
#modificar los valores de velocity correspondientes al eje x:
	if Input.is_action_pressed("ui_right"):
		velocity.x = velocity.x+1 
		$AnimatedSprite.animation= "guiño"	
	if Input.is_action_pressed("ui_left"):
		velocity.x = velocity.x-1
		$AnimatedSprite.animation= "cerrados"	 
#modificar los valores de velocity correspondientes al eje y:
	if Input.is_action_pressed("ui_up"):
		velocity.y = velocity.y-1 
		$AnimatedSprite.animation= "abiertos"	
	if Input.is_action_pressed("ui_down"):
		velocity.y = velocity.y+1
				
pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
