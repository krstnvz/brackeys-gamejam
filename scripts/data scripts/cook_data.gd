class_name CookData
extends Resource

enum Cooks { ROSE, SIMON, PETER }

@export var cook: Cooks = 0
@export var statement: String = ""
@export var normal: AtlasTexture
@export var hightlight: AtlasTexture
