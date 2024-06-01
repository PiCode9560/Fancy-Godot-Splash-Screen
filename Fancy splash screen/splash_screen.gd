extends Control

@onready var path_follow_2d = $CenterContainer/Control/Node2D/Path2D/PathFollow2D
@onready var path_2d:Path2D = $CenterContainer/Control/Node2D/Path2D
@onready var line_2d = $CenterContainer/Control/Node2D/Line2D
@onready var camera_2d = $CenterContainer/Control/Node2D/Camera2D
@onready var animation_player = $CenterContainer/Control/Node2D/AnimationPlayer
@export var animation_curve :Curve

func _ready():
	camera_2d.position = path_follow_2d.position+Vector2(-512,-585.5)
	var points = path_2d.curve.get_baked_points()
	for i in range(1,points.size()):
		var p = points[i]
		line_2d.add_point(p)

func _process(delta):
	var pos = (path_follow_2d.position+Vector2(-512,-585.5))*(animation_curve.sample_baked(((animation_player.current_animation_position-1)/3)))
	camera_2d.position = lerp(camera_2d.position,pos,0.2)
