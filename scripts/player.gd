extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"): velocity.x += 1
	if Input.is_action_pressed("left"): velocity.x -= 1
	if Input.is_action_pressed("up"): velocity.y -= 1
	if Input.is_action_pressed("down"): velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
