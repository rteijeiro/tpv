extends Control



var start: bool
var num1: String
var num2: String
var currentNum: int
var res: float
var operation: String

@onready var price = $PanelContainer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PanelContainer/HBoxContainer/Price


func _ready() -> void:
	start = true
	currentNum = 1

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
	if currentNum == 1:
		num1 += number
		price.text = num1
	else:
		num2 += number
		price.text = num2

func selectOperation(element):
	operation = element
	if start == true:
		res = float(num1)
		currentNum = 2
		start = false
	else:
		if currentNum == 1:
			if operation == '+':
				res += float(num1)
			if operation == '-':
				res -= float(num1)
			if operation == '*':
				res *= float(num1)
			if operation == '/':
				res /= float(num1)
			currentNum = 2
			num2 = ''
		else:
			if operation == '+':
				res += float(num2)
			if operation == '-':
				res -= float(num2)
			if operation == '*':
				res *= float(num2)
			if operation == '/':
				res /= float(num2)
			currentNum = 1
			num1 = ''
	price.text = element

func _on_equals_pressed() -> void:
	if currentNum == 1:
		if operation == '+':
			res += float(num1)
		if operation == '-':
			res -= float(num1)
		if operation == '*':
			res *= float(num1)
		if operation == '/':
			res /= float(num1)
		#if operation == '%':
			#res %= float(input)
	else:
		if operation == '+':
			res += float(num2)
		if operation == '-':
			res -= float(num2)
		if operation == '*':
			res *= float(num2)
		if operation == '/':
			res /= float(num2)
		#if operation == '%':
			#res %= float(input)
	price.text = str(res)
	num1 = ''
	num2 = ''
	res = 0
	currentNum = 1
	start = true

func _on_delete_pressed() -> void:
	if currentNum == 1:
		if num1.length() > 0:
			num1[-1] = ''
			price.text = num1
	else:
		if num2.length() > 0:
			num2[-1] = ''
			price.text = num2
