extends Node
@export var max_health = 10
@export var health = 0
signal health_changed(new_value)
signal dead

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	health_changed.emit(health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(damage: int):
	health = health - damage
	if (health <= 0):
		dead.emit()
	health_changed.emit(health)
	
func heal_health(heal: int):
	health = health + heal
	health_changed.emit(health)
