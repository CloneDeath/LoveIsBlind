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
	if (is_on_floor() && self.JUMP):
		velocity.y -= jump_speed;
	velocity.y += gravity * delta;
	velocity = move_and_slide(velocity, Vector2(0, -1));

	if (LEFT): print("left");

	if self.is_on_floor():
		if self.LEFT == self.RIGHT:
			set_animation("idle");
		else:
			if self.is_on_wall():
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