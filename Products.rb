=begin
	Name: Products.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: Products object
=end
require "json"
require_relative "Product.rb"

class Products

	# Constructor	
	def initialize()

		# Instance variables
		@productsArray = []

		# Load products from JSON
		fileProducts = File.read("Products.json")
		productsJSON = JSON.parse(fileProducts)

		# Create products
		productsJSON.each do |productJSON|

			code = productJSON["code"]
			name = productJSON["name"]
			price = productJSON["price"]
			newProduct = Product.new(code, name, price)
			@productsArray << newProduct
		end
	end

	# Getters & Setters
	attr_accessor :productsArray

end
