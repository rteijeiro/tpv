extends Control



var input: String
var res: float
var operation: String

@onready var price = $PanelContainer/MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PanelContainer/HBoxContainer/Price


func _on_uno_pressed() -> void:
	input += '1'
	price.text = input

func _on_dos_pressed() -> void:
	input += '2'
	price.text = input

func _on_tres_pressed() -> void:
	input += '3'
	price.text = input

func _on_suma_pressed() -> void:
	res = int(input)
	input = ''
	operation = '+'
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

func _on_cuatro_pressed() -> void:
	input += '4'
	price.text = input

func _on_cinco_pressed() -> void:
	input += '5'
	price.text = input

func _on_seis_pressed() -> void:
	input += '6'
	price.text = input

func _on_multiplicacion_pressed() -> void:
	res = int(input)
	input = ''
	operation = '*'
	price.text = input

func _on_siete_pressed() -> void:
	input += '7'
	price.text = input


func _on_ocho_pressed() -> void:
	input += '8'
	price.text = input

func _on_nueve_pressed() -> void:
	input += '9'
	price.text = input

func _on_resta_pressed() -> void:
	res = int(input)
	input = ''
	operation = '-'
	price.text = input

func _on_modulo_pressed() -> void:
	res = int(input)
	input = ''
	operation = '%'
	price.text = input

func _on_cero_pressed() -> void:
	input += '0'
	price.text = input

func _on_division_pressed() -> void:
	res = int(input)
	input = ''
	operation = '/'
	price.text = input

func _on_decimal_pressed() -> void:
	input += '.'
	price.text = input
