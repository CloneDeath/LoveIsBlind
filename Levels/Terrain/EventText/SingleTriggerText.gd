extends Area2D

signal revealed();

var triggered = false;

func _process(_delta):
	if (triggered): return;
	if (get_overlapping_bodies().size() > 0):
		triggered = true;
		$EventText.show();
		emit_signal("revealed");