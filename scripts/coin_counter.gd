extends HBoxContainer

@export var coinCounter : RichTextLabel

func _ready():
	GameManager.coinCounterText = coinCounter
	GameData._print_current_coin_count()
