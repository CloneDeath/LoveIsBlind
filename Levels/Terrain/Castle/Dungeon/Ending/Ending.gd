extends Node2D

#warning-ignore:unused_signal
signal game_over();

func start():
	$Controller.play("finale");