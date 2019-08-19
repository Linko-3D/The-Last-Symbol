extends StaticBody

func spawn():
		$Spawn.visible = true
		$Spawn/SpawnCollision.disabled = false
		$AnimationPlayer.play("Color")