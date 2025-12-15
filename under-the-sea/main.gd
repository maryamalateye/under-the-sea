extends Node3D
var xr_interface: XRInterface
#@onready var environment:Environment = $"../WorldEnvironment".environment

@onready var shark = $blacknoseShark
@onready var tempVP = $XROrigin3D/leftHand/LeftHand/Viewport2Din3D

var label = Label

func _ready():
	xr_interface = XRServer.primary_interface
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")
		
		#turn off v-sync
		#DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
		#change main viewport to output to HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, check if headset is connected")
		
	#GET LABEL HERE
	var label_root = tempVP.get_scene_instance()
	if label_root == null:
		push_error("ERROR WITH LABEL")
		return
	
	label = label_root.get_node("MarginContainer/VBoxContainer/Label")

	#connecting signals to being picked up
	for fish in get_tree().get_nodes_in_group("fish"):
		fish.picked_up.connect(_on_picked_up)
		fish.dropped.connect(_on_dropped)
	
	
	#shark.picked_up.connect(_on_picked_up)
	#shark.dropped.connect(_on_dropped)

func _on_picked_up(fish):
	print("Picked fish:", fish.fish_name, "text: ", fish.fish_info_text)
	if label:
		label.text = fish.fish_info_text

func _on_dropped(_fish):
	if label:
		label.text = "Welcome to under the sea!"
