extends "res://Levels/Terrain/Base/BaseBlock.gd"

var touchTime = 0;

func push(_player, delta):
	touchTime += delta;

func _process(_delta):
	$Sprite2.visible = $Sprite.visible;
	$Sprite2.modulate = $Sprite.modulate;
	$WindowOpen.play("windowOpen");
	$WindowOpen.advance(touchTime);
