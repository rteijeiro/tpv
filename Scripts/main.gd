extends Control

@onready var grid_container = $HSplitContainer/HSplitContainer/PanelContainer/ScrollContainer/GridContainer

# Diccionario con los productos cargados desde JSON
var products = []

# Ruta del archivo JSON
const PRODUCTS_FILE = "res://files/products.txt"

# Cargar el archivo JSON al iniciar
func _ready():
	load_products()
	connect_category_buttons()

# Cargar productos desde el JSON
func load_products():
	var file = FileAccess.open(PRODUCTS_FILE, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		var json_data = JSON.parse_string(json_string)
		if json_data:
			products = json_data
		file.close()

# Conectar los botones de categoría a la función que los maneja
func connect_category_buttons():
	var button_container = $HSplitContainer/HSplitContainer/VBoxContainer
	for button in button_container.get_children():
		button.pressed.connect(func(): show_products(button.text))

# Mostrar productos según la categoría seleccionada
func show_products(category: String):
	grid_container.clear() # Limpiar productos anteriores
	for product_data in products:
		if product_data["type"].to_lower() == category.to_lower():
			var product = Product.new(product_data["type"], product_data["name"], product_data["price"])
			add_product_to_grid(product)

# Instanciar un `ProductItem` y agregarlo al `GridContainer`
func add_product_to_grid(product: Product):
	var product_scene = load("res://product_item.tscn").instantiate()
	product_scene.set_product(product)
	grid_container.add_child(product_scene)

# Eliminar todos los productos antes de mostrar nuevos
func clear():
	for child in grid_container.get_children():
		child.queue_free()
