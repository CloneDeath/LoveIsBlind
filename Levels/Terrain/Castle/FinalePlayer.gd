extends "res://Levels/Terrain/Base/BaseBlock.gd"

signal game_over();

func game_over():
	emit_signal("game_over");

func _process(_delta):
	$Sprite2.visible = $Sprite.visible;
	$Sprite2.modulate = $Sprite.modulate;

func revealed():
	.revealed();
	for body in $PlayerDetection.get_overlapping_bodies():
		if (body.is_in_group("player")):
			body.enabled = false;
			body.visible = false;
			$Ending.global_position = body.global_position;
	$Ending.visible = true;
	$Ending.start();
