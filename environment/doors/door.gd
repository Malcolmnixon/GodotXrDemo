extends Node

signal door_opening
signal door_opened
signal door_closing
signal door_closed

enum State {
	Closed = 1,
	Opening = 2,
	Open = 3,
	Closing = 4
}

var state = State.Closed

func _ready():
	$AnimationPlayer.connect("animation_finished", self, "_on_animation_finished")

func _on_trigger_handle():
	if state == State.Closed:
		state = State.Opening
		$AnimationPlayer.play("Open")
		emit_signal("door_opening")
	elif state == State.Open:
		state = State.Closing
		$AnimationPlayer.play("Close")
		emit_signal("door_closing")

func _on_animation_finished(anim_name):
	if state == State.Opening:
		state = State.Open
		emit_signal("door_opened")
	elif state == State.Closing:
		state = State.Closed
		emit_signal("door_closed")
