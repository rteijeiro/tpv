extends Control



var input: String
var res: float
var operation: String

@onready var price = $PanelContainer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PanelContainer/HBoxContainer/Price


func _on_uno_pressed() -> void:
	selectNumber('1')

func _on_dos_pressed() -> void:
	selectNumber('2')

func _on_tres_pressed() -> void:
	selectNumber('3')

func _on_cuatro_pressed() -> void:
	selectNumber('4')

func _on_cinco_pressed() -> void:
	selectNumber('5')

func _on_seis_pressed() -> void:
	selectNumber('6')

func _on_siete_pressed() -> void:
	selectNumber('7')

func _on_ocho_pressed() -> void:
	selectNumber('8')

func _on_nueve_pressed() -> void:
	selectNumber('9')

func _on_cero_pressed() -> void:
	selectNumber('0')

func _on_decimal_pressed() -> void:
	selectNumber('.')

func _on_suma_pressed() -> void:
	selectOperation('+')

func _on_resta_pressed() -> void:
	selectOperation('-')

func _on_multiplicacion_pressed() -> void:
	selectOperation('*')

func _on_division_pressed() -> void:
	selectOperation('/')

func _on_modulo_pressed() -> void:
	selectOperation('%')

func _on_delete_pressed() -> void:
	input[-1] = ''
	price.text = input

func selectNumber(number):
	input += number
	price.text = input

func selectOperation(element):
	res = float(input)
	input = ''
	operation = element
	price.text = input

func _on_resultado_pressed() -> void:
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
	print(res)
	price.text = str(res)
	input = ''
	res = 0
