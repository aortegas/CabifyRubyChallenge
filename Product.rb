=begin
	Name: Product.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: Product object
=end
class Product

	# Constructor	
	def initialize(code, name = "Product without name", price)
		@code = code
		@name = name
		@price = price
	end

	# Getters & Setters
	attr_accessor :code
	attr_accessor :name
	attr_accessor :price	
end