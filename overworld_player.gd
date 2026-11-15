extends Node2D
@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	if (Input.is_action_pressed("walk_east")):
		direction.x += 1
	if (Input.is_action_pressed("walk_west")):
		direction.x -= 1
	if (Input.is_action_pressed("walk_north")):
		direction.y -= 1
	if (Input.is_action_pressed("walk_south")):
		direction.y += 1
	direction = direction.normalized()
	var velocity = direction * speed
	position += velocity * delta
	$AnimatedSprite2D.animation = "walk"
	if (velocity.length() > 0):
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	pass
