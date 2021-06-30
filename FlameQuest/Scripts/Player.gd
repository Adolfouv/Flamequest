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
	if Input.is_action_pressed("ui_left"):
		velocity.x = velocity.x-1 
#modificar los valores de velocity correspondientes al eje y:
	if Input.is_action_pressed("ui_up"):
		velocity.y = velocity.y-1 
	if Input.is_action_pressed("ui_down"):
		velocity.y = velocity.y+1
		
# evitar bug de incremento de velocidad por más de 1 tecla presionada
	if velocity.length() > 0:
		velocity = velocity.normalized()*speed #normalized deja la variable de velocidad speed en valor = 1
		get_node("AnimatedSprite").play()
	else: 
		 get_node("AnimatedSprite").stop() # en caso de que el jugador no presione ninguna tecla
#evitar bug de que el jugador salga de la pantalla
	position += velocity*delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
#corregir frames con imagenes segun movimiento
	if velocity.x !=0:
		$AnimatedSprite.animation= "right"	
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y !=0:
		$AnimatedSprite.animation = "up" 
		$AnimatedSprite.flip_v =velocity.x > 0		
pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
