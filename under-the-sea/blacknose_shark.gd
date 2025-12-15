extends XRToolsPickable

@onready var rig := $SharkRig

@export var orbit_radius: float = 10.0
@export var orbit_speed: float = 0.08   #turning speed
@export var swim_speed: float = 0.8    #actual swimming speed

var _swimming := true	#initially swimming
var home_position: Vector3

func _ready():
	super()
	picked_up.connect(_on_picked_up)
	dropped.connect(_on_dropped)

	home_position = rig.global_position

func _process(delta):
	if not _swimming:
		return
	
	rig.rotate_y(orbit_speed * delta)
	rig.translate(Vector3.FORWARD * swim_speed * delta)

	var to_home = rig.global_position - home_position
	var dist = to_home.length()

func _on_picked_up(_p):
	_swimming = false
	#signal to label to print info for this

func _on_dropped(_p):
	_swimming = true
	#signal to label to reset label (go back to original)
