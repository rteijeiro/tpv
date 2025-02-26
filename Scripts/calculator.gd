extends Control



var input: String
var res: float
var operation: String

@onready var price = $PanelContainer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PanelContainer/HBoxContainer/Price


func _on_one_pressed() -> void:
	selectNumber('1')

func _on_two_pressed() -> void:
	selectNumber('2')

func _on_three_pressed() -> void:
	selectNumber('3')

func _on_sum_pressed() -> void:
	selectOperation('+')

func _on_four_pressed() -> void:
	selectNumber('4')

func _on_five_pressed() -> void:
	selectNumber('5')

func _on_six_pressed() -> void:
	selectNumber('6')

func _on_multiplication_pressed() -> void:
	selectOperation('*')

func _on_seven_pressed() -> void:
	selectNumber('7')

func _on_eight_pressed() -> void:
	selectNumber('8')

func _on_nine_pressed() -> void:
	selectNumber('9')

func _on_subtraction_pressed() -> void:
	selectOperation('-')

func _on_percent_pressed() -> void:
	selectOperation('%')

func _on_zero_pressed() -> void:
	selectNumber('0')

func _on_decimal_pressed() -> void:
	selectNumber('.')

func _on_slash_pressed() -> void:
	selectOperation('/')

func selectNumber(number):
	input += number
	price.text = input

func selectOperation(element):
	operation = element
	if res == null:
		res = float(input)
	else:
		if operation == '+':
			res += float(input)
		if operation == '-':
			res -= float(input)
		if operation == '*':
			res *= float(input)
		if operation == '/':
			res /= float(input)
	input = ''
	price.text = input

func _on_equals_pressed() -> void:
	if operation == '+':
		res += float(input)
	if operation == '-':
		res -= float(input)
	if operation == '*':
		res *= float(input)
	if operation == '/':
		res /= float(input)
	#if operation == '%':
		#res %= float(input)
	price.text = str(res)
	input = ''
	res = 0

func _on_delete_pressed() -> void:
	if input.length() > 0:
		input[-1] = ''
		price.text = input
