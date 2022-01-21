extends Area

# Signal indicating the area has been triggered
signal triggered

# enum our buttons, should find a way to put this more central
enum Buttons {
	VR_BUTTON_BY = 1,
	VR_GRIP = 2,
	VR_BUTTON_3 = 3,
	VR_BUTTON_4 = 4,
	VR_BUTTON_5 = 5,
	VR_BUTTON_6 = 6,
	VR_BUTTON_AX = 7,
	VR_BUTTON_8 = 8,
	VR_BUTTON_9 = 9,
	VR_BUTTON_10 = 10,
	VR_BUTTON_11 = 11,
	VR_BUTTON_12 = 12,
	VR_BUTTON_13 = 13,
	VR_PAD = 14,
	VR_TRIGGER = 15
}

# Selected button to be sensitive to
export (Buttons) var trigger_button_id = Buttons.VR_GRIP

# Called by Function_Trigger when buttons are pressed in this area
func trigger(p_button):
	# If the button matches then emit the triggered signal
	if p_button == trigger_button_id:
		emit_signal("triggered")
