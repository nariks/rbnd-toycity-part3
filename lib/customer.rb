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
    raise NoSuchCustomerError, "No customer called #{name} exists on file"                          #error raised if no match found
  end

  def self.all
    @@customers
  end

  #to initiate a purchase transation after checking if stock is available
  def purchase(product)
    return Transaction.new(self, product) if product.in_stock?                                            #register purchase transaction if there is stock on hand
    raise OutOfStockError, "#{product.title} is out of stock"                                                   #error raised if 0 stock on hand
  end

end
