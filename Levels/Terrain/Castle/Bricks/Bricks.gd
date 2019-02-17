extends "res://Levels/Terrain/Base/BaseBlock.gd"
tool

export(int, 0, 5) var brick_index = 0;

func _process(_delta):
	$Sprite.frame = brick_index;
	if Engine.editor_hint:
		$Sprite.visible = true;