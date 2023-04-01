extends Area2D
onready var main = get_tree().get_current_scene()

func _ready():
	pass 

func _on_dead_body_entered(body):
	main.score += 1
	main.get_node("HUD").update_score(main.score)
	$AnimationPlayer.play("dead")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
