# Tween Animator Lite — Godot 4

Free named tween animations for Godot 4 via autoload. Fire-and-forget property tweens by name. Lite supports up to 6 concurrent tweens.

## Features (Lite — Free)

- `play(tween_id, target, property, ...)` — animate a property
- `stop(tween_id)` / `stop_all()`
- `is_playing(tween_id)` / `active_tweens()` / `tween_count()`
- Signal: `tween_finished(tween_id)`
- Up to 6 concurrent tweens · zero dependencies · pure GDScript autoload

## Quick Start

```gdscript
# Add addons/tween_animator_lite/tween_animator.gd as autoload named "TweenAnimator"
TweenAnimator.play("fade", $Sprite, "modulate:a", 0.0, 1.0)
TweenAnimator.tween_finished.connect(func(id): print(id, " done"))
```

## Upgrade to PRO

[Tween Animator PRO](https://godot-forge.itch.io/tween-animator-pro-godot) adds unlimited tweens, sequences, loops, callbacks and presets.

---
Made with ♥ by [GodotForge](https://itch.io/profile/godot-forge)
