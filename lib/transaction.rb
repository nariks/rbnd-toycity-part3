class Transaction

  attr_reader :customer, :product, :id, :type
  @@id = 0
  @@transactions = []


  def initialize(customer, product)
    @customer = customer
    @product = product
    @@id += 1
    @id = @@id
    product.stock -= 1                #reduces stock on hand by one when new transaction occurs
    @@transactions << self
  end

  def self.all
    @@transactions
  end

  #Searches for a transaction by id and returns transation details.
  def self.find(id)
    @@transactions.each {|transaction| return transaction if transaction.id == id }
    raise NoSuchTransactionError, "Transaction #{id} does not exist."                                     #error raised if no match found
  end

  #Returns a list of products purchsed by a customer
  def self.find_by_cust(name)
    purchases_by_cust = []
    @@transactions.each do |transaction|
      purchases_by_cust << transaction.product.title if transaction.customer.name == name
    end
    return purchases_by_cust
  end

  #Returns a list of customers who purchased a product
  def self.find_by_product(product)
    customers = []
    @@transactions.each do |transaction|
      customers << transaction.customer.name if transaction.product.title == product.title
    end
    return customers.uniq           #only returns unique customers who purchased a product
  end

end
