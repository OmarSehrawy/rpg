extends Node2D
signal turn_finished
@export var damage = 3
@export var enemy: Node2D
@export var command_window: VBoxContainer
@export var win_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_command_pressed() -> void:
	enemy.get_node("Health").take_damage(damage)
	command_window.hide()
	turn_finished.emit()


func _on_enemy_turn_finished() -> void:
	command_window.show()

func celebrate():
	position.x += 200
	scale *= 2
	win_label.show()

func _on_health_dead() -> void:
	command_window.queue_free()
	celebrate()
