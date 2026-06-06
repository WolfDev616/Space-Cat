extends RigidBody2D


func _ready():
	angular_velocity = 2.0
	
func _process(delta: float) -> void:
	rotation += 0.1 * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
