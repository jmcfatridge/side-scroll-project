extends State

class_name AttackState

@export var return_state : State
@export var return_animation : String = "move"
@export var attack_1_name : String = "attack_1"
@export var attack_2_name : String = "attack_2"

@onready var timer : Timer = $AttackTimer

func state_input(event : InputEvent):
	if (event.is_action_pressed("attack")):
		timer.start()

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == attack_1_name):
		if (timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation)
		else:
			playback.travel(attack_2_name)
			
	if (anim_name == attack_2_name):
		next_state = return_state
		playback.travel(return_animation)
