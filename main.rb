=begin
	Name: main.rb
	Creator: @aortegas
	Date: 11/02/2016 
	Description: main file
=end
require_relative "Products.rb"
require_relative "Rules.rb"
require_relative "Checkout.rb"

# Get Products & Pricing Rules
products = Products.new()
rules = Rules.new() 

# Create a Checkout object with products & rules
checkout = Checkout.new(products, rules)

# Process input args
ARGV.each do |item|
	checkout.scan(item)
end

# Calculate total 
totalPrice = checkout.total

# Output Results
print "Items: "
i = 0
while i < ARGV.length 
	print "#{ARGV[i]}"	
	if i < (ARGV.length - 1)
		print ", " 
	else
		print "\n"
	end
	i += 1
end
printf("Total: %.2f\n", totalPrice)










