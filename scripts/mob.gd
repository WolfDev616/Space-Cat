extends RigidBody2D



func _process(float) -> void:
	rotation += 0.01

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
