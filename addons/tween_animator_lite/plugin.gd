@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("TweenAnimator", "res://addons/tween_animator_lite/tween_animator.gd")

func _exit_tree() -> void:
	remove_autoload_singleton("TweenAnimator")
