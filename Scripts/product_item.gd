extends Panel

@onready var name_label = $VBoxContainer/Name

# Método para inicializar el producto con sus datos
func set_product(product: Product):
	name_label.text = product.name

	# Asigna color según el tipo de producto
	match product.type.to_lower():
		"starter":
			self_modulate = Color(0.6, 1.0, 0.6) # Verde
		"fish":
			self_modulate = Color(0.6, 0.6, 1.0) # Azul
		"meat":
			self_modulate = Color(1.0, 0.6, 0.6) # Rojo
		"dessert":
			self_modulate = Color(1.0, 1.0, 0.6) # Amarillo
		"drink":
			self_modulate = Color(0.8, 0.6, 1.0) # Morado
