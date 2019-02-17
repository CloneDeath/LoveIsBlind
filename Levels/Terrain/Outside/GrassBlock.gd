extends "res://Levels/Terrain/Castle/CastleBlock.gd"

func _ready():
	var U = has_block(Vector2(0, -16));
	var R = has_block(Vector2(16, 0));
	var D = has_block(Vector2(0, 16));
	var L = has_block(Vector2(-16, 0));
	var extents = Vector2(5, 5);

	if (U):
		extents.y += 1.5;
		$CollisionShape2D.position.y -= 1.5;
	if (D):
		extents.y += 1.5;
		$CollisionShape2D.position.y += 1.5;
	if (L):
		extents.x += 1.5;
		$CollisionShape2D.position.x -= 1.5;
	if (R):
		extents.x += 1.5;
		$CollisionShape2D.position.x += 1.5;

	var UR = !has_block(Vector2(16, -16));
	var RD = !has_block(Vector2(16, 16));
	var DL = !has_block(Vector2(-16, 16));
	var UL = !has_block(Vector2(-16, -16));
	var index = (int(U)*1) + (int(R)*2) + (int(D)*4) + (int(L)*8);
	if (index == 15):
		extents = Vector2(5, 5);
		if (UR):
			$Sprite.frame = 16;
		if (RD):
			$Sprite.frame = 17;
		if (DL):
			$Sprite.frame = 18;
		if (UL):
			$Sprite.frame = 19;
	var shape = RectangleShape2D.new();
	shape.extents = extents;
	$CollisionShape2D.shape = shape;