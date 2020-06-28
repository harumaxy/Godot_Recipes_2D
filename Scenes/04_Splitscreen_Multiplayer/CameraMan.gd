extends Node

onready var viewport1 = $ViewportHBoxContainer/ViewportContainer1/Viewport/
onready var viewport2 = $ViewportHBoxContainer/ViewportContainer2/Viewport/
onready var camera1 = $ViewportHBoxContainer/ViewportContainer1/Viewport/Camera2D
onready var camera2 = $ViewportHBoxContainer/ViewportContainer2/Viewport/Camera2D
# TileMap ノードのこと？
onready var tilemap = $ViewportHBoxContainer/ViewportContainer1/Viewport/World
onready var minimap = $Minimap/Viewport
onready var minimapcamera = $Minimap/Viewport/Camera2D

# カメラをタイルマップからはみ出さないように制限
func set_camera_limits(w: TileMap):
	var map_limits := w.get_used_rect() as Rect2
	var map_cellsize := w.cell_size
	for cam in [camera1, camera2]:
		cam.limit_left = map_limits.position.x * map_cellsize.x
		cam.limit_top = map_limits.position.x * map_cellsize.x
		cam.limit_left = map_limits.position.y * map_cellsize.y
		cam.limit_top = map_limits.position.y * map_cellsize.y

func _ready():
	# Viewport ノードの子要素の Node2D の世界は、world_2dで取得できる。(子要素にCanvasItemがないとnull?)
	viewport2.world_2d = viewport1.world_2d
	minimap.world_2d = viewport2.world_2d
	
	camera1.target = tilemap.get_node("Player1")
	camera1.current = true
	camera2.target = tilemap.get_node("Player2")
	camera2.current = true
	minimapcamera.position = Vector2(512, 300)
	

