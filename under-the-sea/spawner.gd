extends Node3D

@export var fish_scene1: PackedScene
@export var fish_scene2: PackedScene
@export var fish_scene3: PackedScene

@export var kill_fish: float = 10.0

var fishes: Array = []

func _ready() -> void:
	spawn_fish(fish_scene1, 3)
	spawn_fish(fish_scene2, 2)
	spawn_fish(fish_scene3, 3)

	var timer = Timer.new()
	timer.wait_time = kill_fish
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_on_kill)

func spawn_fish(fish_scene: PackedScene, amount: int):
	for i in range(amount):
		var fish = fish_scene.instantiate()
		add_child(fish)
		fishes.append(fish)
		
func _on_kill():
	if fishes.is_empty():
		return
	
	var fish = fishes.pick_random()
	fishes.erase(fish)
	fish.queue_free()
		
