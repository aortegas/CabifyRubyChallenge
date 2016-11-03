=begin
	Name: Products.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: Rules object
=end
require "json"
require_relative "BulkRule.rb"
require_relative "FreeForBuyRule.rb"

class Rules

	# Constructor	
	def initialize()

		# Instance variables
		@rulesArray = []

		# Load rules from JSON
		fileRules = File.read("Rules.json")
		rulesJSON = JSON.parse(fileRules)

		# Create rules
		rulesJSON.each do |rulesJSON|

			code = rulesJSON["code"]
			type = rulesJSON["type"]
			data = rulesJSON["data"]

			case type
				when "FreeForBuyRule" then 
					freeItems = data["freeItems"] 
					buyItems = data["buyItems"]	
					newRule = FreeForBuyRule.new(code, type, freeItems, buyItems)

				when "BulkRule" then 
					newPrice = data["newPrice"]
					buyingItems = data["buyingItems"]
					newRule = BulkRule.new(code, type, newPrice, buyingItems)
			end

			@rulesArray << newRule
		end
	end

	# Getters & Setters
	attr_accessor :rulesArray
end
