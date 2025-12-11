extends XRToolsPickable

@onready var rig := $SharkRig

@export var orbit_radius: float = 3.0
@export var orbit_speed: float = 0.3   #turning speed
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
#
	#if dist > orbit_radius:
		## Push shark slightly inward so it stays roughly in a wide circle
		#var inward = -to_home.normalized()
		#rig.global_translate(inward * (dist - orbit_radius) * 0.02)

func _on_picked_up(_p):
	_swimming = false

func _on_dropped(_p):
	_swimming = true
