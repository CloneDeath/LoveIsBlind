extends StaticBody2D

func _ready():
	var U = !has_block(Vector2(0, -16));
	var R = !has_block(Vector2(16, 0));
	var D = !has_block(Vector2(0, 16));
	var L = !has_block(Vector2(-16, 0));
	var index = (int(U)*1) + (int(R)*2) + (int(D)*4) + (int(L)*8);
	$Sprite.frame = index;

func has_block(dp):
	var space_state = get_world_2d().direct_space_state;
	var results = space_state.intersect_point(self.global_position + dp);
	if (!results): return false;
	for block in results:
		if block.collider.is_in_group("block"):
			return true;
	return false;

func _process(_delta):
	for body in $PlayerDetection.get_overlapping_bodies():
		if (body.is_in_group("player") && !$Sprite.visible):
			$AnimationPlayer.play("appear");
