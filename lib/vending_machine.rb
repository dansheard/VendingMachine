require './lib/drink_type'
class VendingMachine

attr_accessor :stock_list

  # Creates a new empty array, to store a list of drinks.	
  def initialize
    @stock_list = Array.new
  end

  # find_drink_type iterates through the available drinks in the @stock_list array,
  # until it finds the drink that matches the drink name stored in the drink_choice
  # parameter.
  #
  # === Parameters
  #
  # drink_choice - the drink chosen by the user.
  #
  # === Returns
  #
  # If the drink_choice parameter matches a drink in the @stock_list array that drink 
  # object is returned. If no match is found, nil is returned.
  def find_drink_type(drink_choice)
      @stock_list.each do |n|
        if n.name == drink_choice
          return n
        end
      end
      return nil
  end 

  # Creates a new drink if the drink is not present. Restocks the drink if the drink is found. 
  # If the drink is new then it's added to the @stock_list array.
  #
  # == Parameters
  #
  # drink_name - The name of the drink to be added or updated.
  # price - The price of the drink to be added or updated.
  # quantity_to_add - The quantity of the drink to be added or updated.
  def restock(drink_name, price, quantity_to_add)
    drink_name = drink_name.downcase
    drink_type = find_drink_type(drink_name)
    if drink_type == nil
        new_drink_type = DrinkType.new(drink_name, price, quantity_to_add)
        @stock_list.push(new_drink_type)
      return  
    else 
      drink_type.stock += quantity_to_add
      drink_type.price = price
    end
  end

  # The purchase method will attempt to dispense a drink and dispense all change remaining after 
  # the attempt has been made. If the attempt fails due to lack of stock or if money_entered
  # is not sufficient. All money_entered is dispensed to the user.
  #
  # === Parameters
  #
  # drink_choice - The name of the drink to be dispensed.
  # money_entered - The amount money used to purchase the drink.
  def purchase(drink_choice, money_entered)
      
      chosen_drink_type = find_drink_type(drink_choice)
      if chosen_drink_type == nil
        puts "Choice not recognised"
        dispense_change(money_entered)
        return
      end

			if chosen_drink_type.stock <= 0	
        puts "Sorry drink out of stock"
        dispense_change(money_entered)
        return			
  		end

      if money_entered < chosen_drink_type.price
          puts "Sorry insufficient money entered."
          dispense_change(money_entered)
          return
  		end

      dispense_drink(chosen_drink_type.name)
      change = money_entered - chosen_drink_type.price
      dispense_change(change)
      chosen_drink_type.stock -= 1
  end

  # The dispense_drink method, outputs a message to the user with the name of the 
  # drink they purchased. This is a place holder for a hardware function which
  # would dispense the drink in a real vending machine.
  #
  # === Parameters
  #
  # drink_name - takes the name of the drink purchased by the user.
  def dispense_drink(drink_name)
      puts "Here is your #{drink_name}"
  end

  # dispense_change calls the change_to_give method on each domination
  # available.
  #
  # == Parameters
  #
  # change_to_give - The difference between the cost of the drink and the amount entered
  # by the user.
	def dispense_change(change_to_give)
			change_to_give = dispense_denomination(change_to_give, 200)
			change_to_give = dispense_denomination(change_to_give, 100)
			change_to_give = dispense_denomination(change_to_give, 50)
			change_to_give = dispense_denomination(change_to_give, 20)
			change_to_give = dispense_denomination(change_to_give, 10)
			change_to_give = dispense_denomination(change_to_give, 5)
			change_to_give = dispense_denomination(change_to_give, 2)
			change_to_give = dispense_denomination(change_to_give, 1)
	end

  # While change_to_give is greater than or equal to the denomination, dispense_denomination
  # calls the dispense_coin method with the denomination as a parameter. 
  #
  # == Parameters
  #
  # change_to_give - The difference between the cost of the purchase and the amount entered
  # by the user.
  # denomination - The available denominations the user can receive.
  #
  # == Returns
  #
  # change_to_give - The amount of change to give.
	def dispense_denomination(change_to_give, denomination)
		while change_to_give >= denomination
				dispense_coin(denomination)
				change_to_give -= denomination			
		end
		return change_to_give
	end

 # Outputs a message to the user with each coin that has been returned to them as change from
 # their drink purchase.
 #
 # == Parameters
 #
 # coin - The coins to be returned to the user.
	def dispense_coin(coin)
			puts "Dispense coin #{coin}" 
	end

end