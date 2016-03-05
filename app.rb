require_relative "lib/errors"
require_relative "lib/customer"
require_relative "lib/product"
require_relative "lib/transaction"

# PRODUCTS

Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
Product.new(title: "Nano Block Empire State Building", price: 49.99, stock: 12)
Product.new(title: "LEGO Firehouse Headquarter", price: 199.99, stock: 0)

puts Product.all.count # Should return 3

# Product.new(title: "LEGO Iron  Man vs. Ultron", price: 22.99, stock: 55)

# Should return DuplicateProductError: 'LEGO Iron Man vs. Ultron' already exists.

nanoblock = Product.find_by_title("Nano Block Empire State Building")
firehouse = Product.find_by_title("LEGO Firehouse Headquarter")
ironman = Product.find_by_title("LEGO Iron Man vs. Ultron")

puts nanoblock.title # Should return 'Nano Block Empire State Building'
puts nanoblock.price # Should return 49.99
puts nanoblock.stock # Should return 12
puts nanoblock.in_stock? # Should return true
puts firehouse.in_stock? # Should return false

products_in_stock = Product.in_stock
# Should return an array of all products with a stock greater than zero
puts products_in_stock.include?(nanoblock) # Should return true
puts products_in_stock.include?(firehouse) # Should return false

# CUSTOMERS

Customer.new(name: "Walter Latimer")
Customer.new(name: "Julia Van Cleve")

puts Customer.all.count # Should return 2

# Customer.new(name: "Walter Latimer")
# Should return DuplicateCustomerError: 'Walter Latimer' already exists.

walter = Customer.find_by_name("Walter Latimer")

puts walter.name # Should return "Walter Latimer"

# TRANSACTIONS

transaction = Transaction.new(walter, nanoblock)

puts transaction.id # Should return 1
puts transaction.product == nanoblock # Should return true
puts transaction.product == firehouse # Should return false
puts transaction.customer == walter # Should return true

puts nanoblock.stock # Should return 11

# PURCHASES

puts walter.purchase(nanoblock)


puts Transaction.all.count # Should return 2

transaction2 = Transaction.find(2)
puts transaction2.product == nanoblock # Should return true

# walter.purchase(firehouse)
#Should return OutOfStockError: 'LEGO Firehouse Headquarter' is out of stock.

#-------------------------------------------------
#The following lines of code have been added to test out the find_by_cust & find_by_cust methods
#of transaction class. find_by_cust returns all products purchased by a customer and
#find_by_prod returns all unique customers who purchased that a product.
puts "\nOutputs added to test the new Transaction methods"
puts "==================================================="
Product.new(title: "LEGO Tin Man", price: 220.99, stock: 155)
Product.new(title: "Empire State Building", price: 149.99, stock: 2)
Product.new(title: "Police Headquarter", price: 99.99, stock: 10)

tinman = Product.find_by_title("LEGO Tin Man")
empire = Product.find_by_title("Empire State Building")
police = Product.find_by_title("Police Headquarter")

Customer.new(name: "Don Quixote")
Customer.new(name: "Prof Moriarty")

don = Customer.find_by_name("Don Quixote")
prof = Customer.find_by_name("Prof Moriarty")
don.purchase(tinman)
prof.purchase(empire)
walter.purchase(police)
don.purchase(empire)
puts "\nProducts purchased by Walter Latimer"
puts "======================================="
puts Transaction.find_by_cust("Walter Latimer")
puts "\nProducts purchased by Don Quixote"
puts "======================================="
puts Transaction.find_by_cust("Don Quixote")
puts "\nProducts purchased by Prof Moriarty"
puts "======================================="
puts Transaction.find_by_cust("Prof Moriarty")
puts "\nCustomers who bought Empire State Building"
puts "=========================================="
puts Transaction.find_by_product(empire)
puts "\nCustomers who bought Nanoblock"
puts "======================================="
puts Transaction.find_by_product(nanoblock)
