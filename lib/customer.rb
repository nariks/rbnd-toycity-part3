class Customer

  attr_reader :name
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_customer
  end

  def add_customer
    @@customers.each do |customer|
      return raise DuplicateCustomerError, "#{@name} already exists" if customer.name == @name
    end
    @@customers << self
  end

  def self.find_by_name(name)
    @@customers.each do |customer|
        return customer if customer.name == name
    end
  end

  def self.all
    @@customers
  end

  def purchase(product)
    if product.stock > 0
      Transaction.new(@name, product)
      "#{@name} has purchased product #{product.title}"
    else
      raise OutOfStockError, "#{product.title} is out of stock"
    end

  end







end
