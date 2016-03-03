class Customer

  attr_reader :name
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_customer
  end

  #add new customer
  def add_customer
    err_msg = "#{@name} already exists"
    @@customers.each {|customer| raise DuplicateCustomerError, err_msg  if customer.name == @name}
    @@customers << self
  end

  #to check if a customer exists
  def self.find_by_name(name)
    @@customers.each {|customer| return customer if customer.name == name }
  end

  def self.all
    @@customers
  end

  #to initiate a purchase transation after checking if stock is available
  def purchase(product)
    if product.in_stock?
      Transaction.new(@name, product)
      "#{@name} has purchased product #{product.title}"
    else
      raise OutOfStockError, "#{product.title} is out of stock"
    end
  end

end
