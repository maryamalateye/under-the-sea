extends Node3D
var xr_interface: XRInterface
#@onready var environment:Environment = $"../WorldEnvironment".environment

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
