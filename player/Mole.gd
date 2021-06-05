extends Sprite

export (float) var speed: = 70.0

onready var targetPos: = global_position
onready var anim: = $AnimationPlayer

var canEnter: = false

enum {
	HOLE = 1,
	FRUIT = 2,
	SNAKE = 4,
}

func _ready()->void:
	Events.mole = self
	set_process(false)
	yield(get_tree().create_timer(1.0), "timeout")
	canEnter = true

func _unhandled_input(event:InputEvent)->void:
	if event.is_action_pressed("click"):
		var mouse:Vector2 = get_global_mouse_position()
		targetPos = mouse
		set_process(true)
		anim.play("Walk")

func _process(delta:float)->void:
	var dist: = targetPos - global_position
	var dir: = dist.normalized()
	if dist.length() < speed * delta:
		global_position = targetPos
		set_process(false)
		anim.play("Idle")
	else:
		global_position += dir * speed * delta
	rotation = dir.angle()


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func HitBox_entered(area_id, area, area_shape, local_shape):
	match area.collision_layer:
		HOLE:
			if !canEnter:
				return
			Events.emit_signal("enter_hole", area.global_position, area.name)
			Events.mole = null
			queue_free()
		FRUIT:
			Events.emit_signal("ate_fruit", area.global_position)
			area.queue_free()
		SNAKE:
			Events.emit_signal("death", global_position)
			Events.mole = null
			queue_free()

