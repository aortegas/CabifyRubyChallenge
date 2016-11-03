=begin
	Name: FreeForBuyRule.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: Free for Buy Rule object
=end
require_relative "Rule.rb"

class FreeForBuyRule < Rule

	# Constructor	
	def initialize(code, type, freeItems, buyItems)
		super(code, type)
		@freeItems = freeItems
		@buyItems = buyItems
	end

	# Getters & Setters
	attr_accessor :code
	attr_accessor :type
	attr_accessor :freeItems
	attr_accessor :buyItems

	# Methods
	def totalPriceForProduct(totalItems, itemPrice)

		totalPriceForProduct = 0.0

		if totalItems < @freeItems
			totalPriceForProduct = totalItems * itemPrice

		else
			# Calculate items with discount
			freeItems = totalItems / @freeItems
			calculateTotalFreeItems = freeItems * @buyItems

			# Calculate items without discount
			calculateTotalBuyItems = totalItems % @freeItems

			# Calculate total items 
			calculateTotalItems = calculateTotalFreeItems + calculateTotalBuyItems

			# Calculate total price for the product
			totalPriceForProduct = calculateTotalItems * itemPrice
		end

		return totalPriceForProduct
	end
end