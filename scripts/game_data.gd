extends Node

var coins : int = 0

func _add_one_coin(): ##just adds one coin
	coins += 1
	_print_current_coin_count()

func _change_coin_count(amount : int): ##can be used for subtraction
	coins += amount
	_print_current_coin_count()

func _print_current_coin_count():
	print("Coins: " + str(coins))
