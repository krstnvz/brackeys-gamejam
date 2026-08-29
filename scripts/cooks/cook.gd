extends TextureButton

@export var cook_data: CookData = null

func _ready() -> void:
	#text = CookData.Cooks.keys()[cook_data.cook]
	self.texture_normal = cook_data.normal
	self.texture_hover = cook_data.hightlight
	
	# Get the image from the texture normal
	var image = texture_hover.get_image()
	# Create the BitMap
	var bitmap = BitMap.new()
	# Fill it from the image alpha
	bitmap.create_from_image_alpha(image)
	# Assign it to the mask
	texture_click_mask = bitmap
