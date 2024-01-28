class_name DeathParticles
extends GPUParticles2D

@export var TEXTURE: Texture2D

var particle_process_material = preload("res://enemy_explode_particle_process_material.tres")
var particle_timer = Timer.new()
var kill_timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	particle_timer.wait_time = 0.2
	particle_timer.one_shot = true
	particle_timer.timeout.connect(wait_until_end)
	particle_timer.autostart = true
	
	add_child(particle_timer)
	
	emitting = true
	amount = 100
	
	if TEXTURE:
		texture = TEXTURE
		
	process_material = particle_process_material

func cleanup():
	queue_free()
	
func wait_until_end():
	emitting = false
	kill_timer.wait_time = 1.0
	kill_timer.one_shot = true
	kill_timer.timeout.connect(cleanup)
	kill_timer.autostart = true
	add_child(kill_timer)
