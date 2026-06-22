extends Node

const MAX_TWEENS: int = 6

signal tween_finished(tween_id: String)

var _tweens: Dictionary = {}

func play(tween_id: String, target: Object, property: String,
		from_val: Variant, to_val: Variant, duration: float,
		ease: Tween.EaseType = Tween.EASE_IN_OUT,
		trans: Tween.TransitionType = Tween.TRANS_LINEAR) -> bool:
	if _tweens.size() >= MAX_TWEENS and not _tweens.has(tween_id):
		push_warning("TweenAnimator Lite: max %d concurrent tweens. Upgrade to PRO." % MAX_TWEENS)
		return false
	stop(tween_id)
	var tw: Tween = create_tween()
	tw.set_ease(ease)
	tw.set_trans(trans)
	tw.tween_property(target, property, to_val, duration).from(from_val)
	tw.finished.connect(_on_finished.bind(tween_id), CONNECT_ONE_SHOT)
	_tweens[tween_id] = tw
	return true

func stop(tween_id: String) -> void:
	if _tweens.has(tween_id):
		var tw: Tween = _tweens[tween_id]
		if tw.is_valid():
			tw.kill()
		_tweens.erase(tween_id)

func stop_all() -> void:
	for id in _tweens.keys():
		stop(id)

func is_playing(tween_id: String) -> bool:
	return _tweens.has(tween_id) and _tweens[tween_id].is_valid() and _tweens[tween_id].is_running()

func active_tweens() -> Array:
	return _tweens.keys()

func tween_count() -> int:
	return _tweens.size()

func _on_finished(tween_id: String) -> void:
	_tweens.erase(tween_id)
	emit_signal("tween_finished", tween_id)
