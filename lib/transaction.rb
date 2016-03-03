class Transaction

  attr_reader :customer, :product, :id
  @@id = 0
  @@transactions =[]


  def initialize(customer, product)
    @customer = customer
    @product = product
    @@id += 1
    @id = @@id
    product.stock -= 1                                         #reduce stock qty when a purchase transaction occurs
    @@transactions << self
  end

  def self.all
    @@transactions
  end

  #Searches for a transaction by id and returns transation details.
  def self.find(id)
    @@transactions.each {|transaction| transaction if transaction.id == id }
  end

end
