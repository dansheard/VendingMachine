require "./lib/vending_machine.rb"
class Interface

    # The main method creates a new instance of the VendingMachine class and stocks the machine 
    # with drinks. It provides interface messages to the user which provides instructions and a list
    # of available drinks for the user to purchase.
    # The main method calls the purchase method on the vending_machine object and passes the user's
    # drink choice and money entered as parameters.
	def main
		vending_machine = VendingMachine.new
    	vending_machine.restock("Pepsi", 155, 5)
    	vending_machine.restock("Fanta", 178, 5)
    	vending_machine.restock("Sprite", 110, 5)

    	puts "\n\n<<< Dan's Vending Machine >>>\n\n"
    	puts "Choose a drink from the list below by typing in the name and pressing enter \n\n"
    	
    	while (true)
    		vending_machine.stock_list.each do |i|
          		puts  "Name: #{i.name}\tPrice: #{i.price}\tQuantity: #{i.stock}" 
        	end 

	    	print "Your choice: " 
	  		drink_choice = gets.chomp.downcase
	  		print "Please enter your money: " 
	  		money_entered = gets.chomp.to_i
	  		vending_machine.purchase(drink_choice, money_entered)
	  	end
  	end

end	