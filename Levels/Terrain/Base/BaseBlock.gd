extends StaticBody2D

signal revealed();
signal touched();

func _ready():
	$Sprite.visible = false;

func touched():
	emit_signal("touched");

func revealed():
	emit_signal("revealed");

func _process(_delta):
	if (is_being_touched()):
		if (!$Sprite.visible):
			$AnimationPlayer.play("appear");
			revealed();
		touched();

func is_being_touched():
	for body in $PlayerDetection.get_overlapping_bodies():
		if (body.is_in_group("player")):
			return true;
	return false;