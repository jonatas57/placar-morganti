extends Control
class_name Text

@onready var texture: TextureRect = $TextureRect
@onready var viewport: SubViewport = $TextureRect/SubViewport
@onready var label: Label = $TextureRect/SubViewport/Label

func _ready() -> void:
	var settings = label.label_settings
	label.label_settings = LabelSettings.new()
	label.label_settings.font = settings.font
	label.label_settings.font_color = settings.font_color
	label.label_settings.font_size = settings.font_size
	label.label_settings.line_spacing = settings.line_spacing
	label.label_settings.outline_color = settings.outline_color
	label.label_settings.outline_size = settings.outline_size
	label.label_settings.shadow_color = settings.shadow_color
	label.label_settings.shadow_offset = settings.shadow_offset
	label.label_settings.shadow_size = settings.shadow_size

func set_text(text: String) -> void:
	label.text = text
	viewport.size.x = text.length() * 128

func set_text_color(color: Color) -> void:
	label.label_settings.font_color = color
