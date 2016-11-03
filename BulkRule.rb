=begin
	Name: BulkRule.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: Bulk Rule object
=end
require_relative "Rule.rb"

class BulkRule < Rule

	# Constructor	
	def initialize(code, type, newPrice, buyingItems)
		super(code, type)
		@newPrice = newPrice
		@buyingItems = buyingItems
	end

	# Getters & Setters
	attr_accessor :code
	attr_accessor :type
	attr_accessor :newPrice
	attr_accessor :buyingItems

	# Methods
	def totalPriceForProduct(totalItems, itemPrice)
		
		totalPriceForProduct = 0.0

		if totalItems < @buyingItems
			totalPriceForProduct = totalItems * itemPrice

		else
			totalPriceForProduct = totalItems * @newPrice

			# Calculate items with discount
			#groupsItemsWithDiscount = totalItems / @buyingItems
			#calculateWithDiscount = groupsItemsWithDiscount * (@newPrice * @buyingItems)

			# Calculate items without discount
			#itemsWithoutDiscount = totalItems % @buyingItems
			#calculateWithoutDiscount = itemsWithoutDiscount * itemPrice

			# Calculate total price for the product
			#totalPriceForProduct = calculateWithDiscount + calculateWithoutDiscount
		end

		return totalPriceForProduct
	end
end