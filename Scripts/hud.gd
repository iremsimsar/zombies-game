extends CanvasLayer

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	
func _on_MsgTimer_timeout():
	$Message.hide()
	
