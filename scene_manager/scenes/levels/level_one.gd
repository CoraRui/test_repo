extends Node2D
class_name level_one

@export var clear_label : Label
@export var next_stage_timer : Timer

@export var next_scene : scene_link

@onready var player_li : player_loader = get_node("/root/player_loader_auto")
@onready var shmup_hi : shmup_health = get_node("/root/shmup_health_auto")
@onready var scene_mi : scene_manager = get_node("/root/scene_manager_auto")
@onready var enemy_li : enemy_loader = get_node("/root/enemy_loader_auto")


func _ready():
	player_li.load_player()
	shmup_hi.set_visible(true)
	enemy_li.queue_finish.connect(level_clear)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func level_clear() -> void:
	clear_label.set_visible(true)
	next_stage_timer.start()


func _on_next_stage_timeout():
	scene_mi.load_scene(next_scene)
	player_li.unload_player()
	enemy_li.clear_enemies()
	shmup_hi.set_visible(false)
	
	
	
