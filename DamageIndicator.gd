class_name DamageIndicator
extends Node

@export var SPRITE: NodePath = "./Sprite2D"
@export var BLINK_COLOR: Color = Color.RED
@export var BLINK_TIME: float = 0.15

var _enable_blink = false
var _start_modulate = null
var _blink_timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_blink_timer.wait_time = BLINK_TIME
	_blink_timer.one_shot = true
	_blink_timer.timeout.connect(_timer_timeout)
	add_child(_blink_timer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _enable_blink:
		var interpolated_color = _interpolate(_start_modulate, BLINK_COLOR, _timer_percent())
		get_node(SPRITE).modulate = interpolated_color


func on_hit_slot():
	_enable_blink = true
	_start_modulate = get_node(SPRITE).modulate
	_blink_timer.start(BLINK_TIME)

func _timer_timeout():
	_enable_blink = false
	
func _timer_percent():
	return _blink_timer.time_left / _blink_timer.wait_time

func _transition_function(x: float) -> float:
	if x <= 0.5:
		return 2.0*x
	else:
		return 2.0*(1.0-x)

func _interpolate(from: Color, to: Color, weight: float):
	var w = _transition_function(weight)
	return (1-w)*from + w*to
