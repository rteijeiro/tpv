extends Control



var num1: String
var res: float
var operations: Array[String]
var numbers: Array[int]

@onready var price = $PanelContainer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PanelContainer/HBoxContainer/Price


func _ready() -> void:
	price.text = str(5)
	res = 5

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
	num1 += number
	price.text = num1

func selectOperation(element):
	operations.append(element)
	num1 = ''
	price.text = element

func _on_delete_pressed() -> void:
	if num1.length() > 0:
		num1[-1] = ''
		price.text = num1

func _on_equals_pressed() -> void:
	#numbers.append(num1)
	#for i in numbers.size():
		#print(numbers[i])
	for i in operations:
		#print(numbers[i])
		if i == '+':
			print("sum")
			res += float(num1)
		if i == '-':
			res -= float(num1)
		if i == '*':
			res *= float(num1)
		if i == '/':
			res /= float(num1)
	price.text = str(res)
	num1 = ''
	res = 0
	operations.clear()
