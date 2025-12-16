extends XRToolsPickable

@onready var rig := $Mesh

@export var fish_name: String = "fish"
@export_multiline var fish_info_text: String = ""
@export var orbit_speed: float = 0.08   #turning speed
@export var swim_speed: float = 0.8    #actual swimming speed

var _swimming := true

func _ready():
	super()
	
	#add fish to fish group
	add_to_group("fish")
	
	picked_up.connect(_on_picked_up)
	dropped.connect(_on_dropped)

func _process(delta):
	if not _swimming:
		return
	
	rig.rotate_y(orbit_speed * delta)
	rig.translate(Vector3.FORWARD * swim_speed * delta)

func _on_picked_up(_p):
	_swimming = false

func _on_dropped(_p):
	_swimming = true
