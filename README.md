# smoothie

## Setup

Turn off screen blanking and remove powersave, etc, by adding these lines to `~/.config/lxsession/LXDE-pi/autostart`

```
@xset s 0 0
@xset s noblank
@xset s noexpose
@xset dpms 0 0 0
```

Use `config/config.txt` to replace/augment `/boot/config.txt` to enable full 1024x600 resolution