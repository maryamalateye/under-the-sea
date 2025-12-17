extends XRToolsPickable

@onready var rig := self

@export var fish_name: String = "fish"
@export_multiline var fish_info_text: String = ""
@export var orbit_speed: float = 0.08   #turning speed
@export var swim_speed: float = 0.8    #actual swimming speed
@export var max_distance := 2.5
@export var return_strength := 1.5
@export var swim_height := 1.8

var player_camera: XRCamera3D
var home_position: Vector3
var _swimming := true

func _ready():
	super()
	
	#add fish to fish group
	add_to_group("fish")
	
	picked_up.connect(_on_picked_up)
	dropped.connect(_on_dropped)
	
	player_camera = get_tree().get_first_node_in_group("xr_camera")

func _process(delta):
	if not _swimming:
		return
	
	rig.rotate_y(orbit_speed * delta)
	rig.translate(Vector3.FORWARD * swim_speed * delta)
	
	if player_camera:
		home_position = player_camera.global_position
		home_position.y = swim_height
	
	var to_home = home_position - rig.global_position
	var distance = to_home.length()
	
	if distance > max_distance:
		var desired_dir = to_home.normalized()
		var current_dir = -rig.global_transform.basis.z
		var turn = current_dir.cross(desired_dir).y
		rig.rotate_y(turn * return_strength * delta)
	
	rig.global_position.y = swim_height

func _on_picked_up(_p):
	_swimming = false

func _on_dropped(_p):
	_swimming = true
