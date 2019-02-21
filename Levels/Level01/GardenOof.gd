extends "res://Levels/Terrain/EventText/SingleTriggerText.gd"

var moved = false;

func _process(_delta):
	if (moved): return;
	var bodies = get_overlapping_bodies();
	if (bodies.size() > 0):
		moved = true;
		self.global_position.x = bodies[0].global_position.x + 1;