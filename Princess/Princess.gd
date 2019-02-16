extends KinematicBody2D

var velocity = Vector2(0, 0);
var gravity = 200;
var speed = 50;
var jump_speed = 150;

var LEFT = false setget ,get_input_left;
var RIGHT = false setget ,get_input_right;
var JUMP = false setget ,get_input_jump;

func get_input_left(): return Input.is_action_pressed("move_left");
func get_input_right(): return Input.is_action_pressed("move_right");
func get_input_jump(): return Input.is_action_just_pressed("jump");

func _physics_process(delta):
	velocity.x = (int(self.RIGHT) - int(self.LEFT)) * speed;
	if (is_floor_detected() && self.JUMP):
		velocity.y -= jump_speed;
	velocity.y += gravity * delta;
	velocity = move_and_slide(velocity, Vector2(0, -1), false, 20);

	if self.LEFT != self.RIGHT:
		$Sprite.scale.x = 1 if self.RIGHT else -1;

	if self.is_floor_detected():
		if self.LEFT == self.RIGHT:
			set_animation("idle");
		else:
			if self.is_wall_detected():
				set_animation("push");
			else:
				set_animation("walk");
	else:
		if velocity.y > 0:
			set_animation("fall");
		else:
			set_animation("rise");

func set_animation(animation):
	if $AnimationPlayer.is_playing() && $AnimationPlayer.current_animation == animation:
		return;
	$AnimationPlayer.play(animation);

func is_wall_detected():
	for block in $Sprite/WallDetection.get_overlapping_bodies():
		if block.is_in_group("block"):
			return true;
	return false;

func is_floor_detected():
	for block in $Sprite/FloorDetection.get_overlapping_bodies():
		if block.is_in_group("block"):
			return true;
	return false;