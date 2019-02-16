extends "res://Levels/Terrain/Base/BaseBlock.gd"

var touchTime = 0;

func push(player, delta):
	touchTime += delta;

func _process(delta):
	$Sprite2.visible = $Sprite.visible;
	$Sprite2.modulate = $Sprite.modulate;
	$WindowOpen.play("windowOpen");
	$WindowOpen.advance(touchTime);
