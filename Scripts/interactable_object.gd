extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.nearestItem = self
		body.inRange = true
		print("Player near ", self)



func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		body.nearestItem = null
		body.inRange = false
		print("Player leaving ", self)



	
