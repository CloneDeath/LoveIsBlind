extends "res://Levels/Terrain/Castle/CastleBlock.gd"

func _ready():
	var U = !has_block(Vector2(0, -16));
	var R = !has_block(Vector2(16, 0));
	var D = !has_block(Vector2(0, 16));
	var L = !has_block(Vector2(-16, 0));
	$CollisionShape2D.shape = RectangleShape2D.new();
	$CollisionShapeUp.disabled = U;
	$CollisionShapeRight.disabled = R;
	$CollisionShapeDown.disabled = D;
	$CollisionShapeLeft.disabled = L;

	var UR = !has_block(Vector2(16, -16));
	var RD = !has_block(Vector2(16, 16));
	var DL = !has_block(Vector2(-16, 16));
	var UL = !has_block(Vector2(-16, -16));
	var index = (int(U)*1) + (int(R)*2) + (int(D)*4) + (int(L)*8);
	if (index == 0):
		if (UR):
			$Sprite.frame = 16;
		if (RD):
			$Sprite.frame = 17;
		if (DL):
			$Sprite.frame = 18;
		if (UL):
			$Sprite.frame = 19;