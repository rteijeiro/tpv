extends Control

@onready var grid_container = $HSplitContainer/HSplitContainer/PanelContainer/ScrollContainer/GridContainer

# Array with de products loaded from JSON
var products = []

# JSON file path
const PRODUCTS_FILE = "res://files/products.txt"

# Load the JSON file at the beginning
func _ready():
	load_products()
	connect_category_buttons()

# Function to load the JSON file
func load_products():
	var file = FileAccess.open(PRODUCTS_FILE, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		var json_data = JSON.parse_string(json_string)
		if json_data:
			products = json_data
		file.close()

# Connect each button to their categories
func connect_category_buttons():
	var button_container = $HSplitContainer/Menu/Panel/Sections/Margin_Starters/Starters
	for button in button_container.get_children():
		button.pressed.connect(func(): show_products(button.text))

# Show products of each categorie
func show_products(category: String):
	grid_container.clear() # Limpiar productos anteriores
	for product_data in products:
		if product_data["type"].to_lower() == category.to_lower():
			var product = Product.new(product_data["type"], product_data["name"], product_data["price"])
			add_product_to_grid(product)

# Instantiate a product_item and adding it to the container
func add_product_to_grid(product: Product):
	var product_scene = load("res://product_item.tscn").instantiate()
	product_scene.set_product(product)
	grid_container.add_child(product_scene)

# Delete all products before showig others ones
func clear():
	for child in grid_container.get_children():
		child.queue_free()
