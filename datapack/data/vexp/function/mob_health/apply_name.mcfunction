# This macro applies the name to a text_display
# $(hp) and $(max) use $(color) for dynamic health coloring
$data modify entity @s text set value {"text":"","extra":[$(name),{"text":"\n","color":"white"},{"text":"$(hp) ❤","color":"$(color)"}]}
