extends Node2D
signal turn_finished
@export var damage = 2
@export var player_target: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_health_dead() -> void:
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.flip_v = true
	queue_free()


func _on_player_turn_finished() -> void:
	player_target.get_node("Health").take_damage(damage)
	turn_finished.emit()
