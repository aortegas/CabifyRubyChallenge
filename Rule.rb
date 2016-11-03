=begin
	Name: Rule.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: Rule object
=end
class Rule

	# Constructor	
	def initialize(code, type)
		@code = code
		@type = type
	end

	# Getters & Setters
	attr_accessor :code
	attr_accessor :type
end