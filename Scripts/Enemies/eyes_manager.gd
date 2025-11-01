extends Node3D

var Eyes : Array

func _ready() -> void:
	Eyes = get_tree().get_nodes_in_group("Eyes")

func _process(delta: float) -> void:
	for Eye in Eyes:
		if Eye.IsVisible():
			Eye.timeToKill = Eye.timeToKill - 1 * delta
			var color_rect = Eye.target.get_node("CanvasLayer/ColorRect")
			if color_rect.material and color_rect.material is ShaderMaterial:
				var material = color_rect.material as ShaderMaterial
				var new_amplitude = 3.0 + (1.0 - Eye.timeToKill) * 46.0
				material.set_shader_parameter("noise_amplitude", new_amplitude)
			if Eye.timeToKill <= 0:
				Eye.target.LoseGame();
			break;
		else:
			Eye.timeToKill = 1.0
			var color_rect = Eye.target.get_node("CanvasLayer/ColorRect")
			if color_rect.material and color_rect.material is ShaderMaterial:
				var material = color_rect.material as ShaderMaterial
				material.set_shader_parameter("noise_amplitude", 3.0)
	
