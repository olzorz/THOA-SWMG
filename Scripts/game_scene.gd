extends Node2D

@onready var cash_total: Label = %CashTotal

var total_cash: int = 0

func money_gain(amount: int) -> void:
	total_cash += amount
	cash_total.text = "£" + str(total_cash)
