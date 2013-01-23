class DrinkType
	attr_accessor :name, :price, :stock
  	
  	# The initialize method, initialises new DrinkType objects.
  	#
  	# Parameters
  	#
  	# name - The name of the new drink object
  	# price - The price of the new drink object
  	# stock - The stock level of the new drink object

	def initialize(name, price, stock)
  		@name = name
  		@price = price
  		@stock = stock
  	end


end