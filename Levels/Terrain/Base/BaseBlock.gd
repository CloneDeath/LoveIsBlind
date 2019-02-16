extends StaticBody2D

func _ready():
	$Sprite.visible = false;

func _process(_delta):
	for body in $PlayerDetection.get_overlapping_bodies():
		if (body.is_in_group("player") && !$Sprite.visible):
			$AnimationPlayer.play("appear");
