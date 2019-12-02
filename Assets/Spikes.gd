extends Area

func _on_Spikes_body_entered(body):
	get_tree().reload_current_scene()
