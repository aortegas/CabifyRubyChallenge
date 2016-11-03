=begin
	Name: Product.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: Checkout object
=end
class Checkout

	# Constructor	
	def initialize(products, rules)
		@products = products
		@rules = rules
		@items = Hash.new
	end

	# Getters & Setters
	attr_accessor :products
	attr_accessor :rules

	# Methods
	def scan(product)
		items = @items[product]
		if items == nil 
			items = 1
		else
			items +=1
		end
		@items[product] = items
	end

	def total
		totalPrice = 0.0

		# Iterar diccionarios
		@items.each do |product, items|
		
			productPrice = 0.0
			ruleType = ""
			rule = nil

			# Search product into products
			@products.productsArray.each do |productInProducts|
				if product == productInProducts.code
					productPrice = productInProducts.price
				end
			end

			# Search possible rule for the product
			@rules.rulesArray.each do |ruleInRules|
				if product == ruleInRules.code
					ruleType = ruleInRules.type
					rule = ruleInRules
				end
			end

			# Calculate total price for the product
			if ruleType == ""
				totalPrice += productPrice * items
			else
				totalPrice += rule.totalPriceForProduct(items, productPrice)
			end
		end

		return totalPrice
	end
end
