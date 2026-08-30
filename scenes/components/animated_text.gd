extends RichTextLabel

const LETTER_TIME: float = 0.06
const PUNCTUATION_TIME: float = 0.3

var tween: Tween
var displyed_text = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func say_line():
	if displyed_text == false:
		say()
		displyed_text = true
	else:
		if tween:
			tween.kill()
		self.visible_characters = -1

func say():
	if tween: tween.kill()
	tween = create_tween()
	
	self.visible_characters = 0
	
	var label_text = self.get_parsed_text()
	
	var index = 0
	var last_punct_index = 0
	var text_length = label_text.length()

	for letter in label_text:
		index += 1

		# only add a MethodTweener at punctuations or end of string
		if not(letter in [".", "?", "!", ","] or index == text_length): 
			continue
		
		# reveal letters between the last punctuation and the current one
		var duration = (index - last_punct_index) * LETTER_TIME
		tween.tween_method(_reveal_char, last_punct_index, index, duration)
		
		# wait a bit after commas and punctuation
		if letter == ",":
			tween.tween_interval(PUNCTUATION_TIME/2.0)
		else: 
			tween.tween_interval(PUNCTUATION_TIME)
		
		last_punct_index = index

# method called every frame by the MethodTweener
func _reveal_char(v: int):
	if self.visible_characters == v:
		return
	self.visible_characters = v

func _on_visibility_changed() -> void:
	if visible:
		say_line()
